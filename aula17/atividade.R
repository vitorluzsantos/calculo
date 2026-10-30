# Exploração e Modelagem de Dados com R
# Dataset: Medical Cost Personal Datasets (Kaggle)
# https://www.kaggle.com/datasets/mirichoi0218/insurance
# Variáveis: age, sex, bmi (IMC), children, smoker, region, charges

library(tidyverse)

dir.create("graficos", showWarnings = FALSE)

# 1. carregar os dados
dados_raw <- read_csv("insurance.csv")

glimpse(dados_raw)
summary(dados_raw)

# 2. limpeza
cat("\nValores ausentes por coluna:\n")
print(colSums(is.na(dados_raw)))

cat("\nLinhas duplicadas:", sum(duplicated(dados_raw)), "\n")

dados <- dados_raw %>%
  distinct() %>%       
  drop_na() %>%
  mutate(
    sex    = factor(sex, levels = c("female", "male"),
		labels = c("Feminino", "Masculino")),
		smoker = factor(smoker, levels = c("no", "yes"),
    labels = c("Não fumante", "Fumante")),
    region = factor(region),
    faixa_imc = cut(bmi,
    breaks = c(0, 18.5, 25, 30, Inf),
    labels = c("Abaixo do peso", "Normal", "Sobrepeso", "Obesidade"), right = FALSE)
  )

# 3. data frame final pronto para análise
cat("\nData frame final:", nrow(dados), "linhas x", ncol(dados), "colunas\n")
glimpse(dados)
head(dados)

tema <- theme_minimal(base_size = 13)

g1 <- ggplot(dados, aes(x = charges)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(title = "Distribuição do valor cobrado (charges)", x = "Valor cobrado (US$)", y = "Frequência") + tema
	ggsave("graficos/01_hist_charges.png", g1, width = 8, height = 5)

g2 <- ggplot(dados, aes(x = smoker, y = charges, fill = smoker)) +
  geom_boxplot(show.legend = FALSE) +
  labs(title = "Valor cobrado por condição de fumante",
  x = NULL, y = "Valor cobrado (US$)") + tema

ggsave("graficos/02_box_smoker.png", g2, width = 8, height = 5)

g3 <- ggplot(dados, aes(x = age, y = charges, color = smoker)) +
  geom_point(alpha = 0.6) +
  labs(title = "Idade x valor cobrado", x = "Idade (anos)", y = "Valor cobrado (US$)", color = NULL) + tema
ggsave("graficos/03_age_charges.png", g3, width = 8, height = 5)

g4 <- ggplot(dados, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.6) +
  labs(title = "IMC x valor cobrado", x = "IMC", y = "Valor cobrado (US$)", color = NULL) + tema
ggsave("graficos/04_bmi_charges.png", g4, width = 8, height = 5)

g5 <- dados %>%
  group_by(region) %>%
  summarise(media = mean(charges)) %>%
  ggplot(aes(x = reorder(region, media), y = media)) +
  geom_col(fill = "darkorange") +
  labs(title = "Valor médio cobrado por região", x = NULL, y = "Média (US$)") + tema

ggsave("graficos/05_regiao.png", g5, width = 8, height = 5)

cat("\nMatriz de correlação:\n")
print(round(cor(dados %>% select(age, bmi, children, charges)), 3))

tabela_resumo <- dados %>%
  group_by(smoker) %>%
  summarise(n = n(),
  media_charges = round(mean(charges), 2),
  mediana_charges = round(median(charges), 2),
  media_bmi = round(mean(bmi), 2))
print(tabela_resumo)

m1 <- lm(charges ~ age, data = dados)
cat("\n===== Modelo 1: charges ~ age =====\n")
print(summary(m1))

m2 <- lm(charges ~ bmi, data = dados)
cat("\n===== Modelo 2: charges ~ bmi =====\n")
print(summary(m2))

fumantes <- dados %>% filter(smoker == "Fumante")
m3 <- lm(charges ~ bmi, data = fumantes)
cat("\n===== Modelo 3: charges ~ bmi (somente fumantes) =====\n")
print(summary(m3))

comparacao <- tibble(
  modelo = c("charges ~ age", "charges ~ bmi", "charges ~ bmi (fumantes)"),
  intercepto = c(coef(m1)[1], coef(m2)[1], coef(m3)[1]),
  coeficiente = c(coef(m1)[2], coef(m2)[2], coef(m3)[2]),
  r2 = c(summary(m1)$r.squared, summary(m2)$r.squared, summary(m3)$r.squared)
) %>% mutate(across(where(is.numeric), ~ round(.x, 4)))
cat("\nComparação dos modelos:\n")
print(comparacao)

g6 <- ggplot(dados, aes(age, charges)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Regressão: valor cobrado ~ idade", x = "Idade", y = "Valor cobrado (US$)") + tema
ggsave("graficos/06_reg_age.png", g6, width = 8, height = 5)

g7 <- ggplot(dados, aes(bmi, charges)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Regressão: valor cobrado ~ IMC", x = "IMC", y = "Valor cobrado (US$)") + tema
ggsave("graficos/07_reg_bmi.png", g7, width = 8, height = 5)

g8 <- ggplot(fumantes, aes(bmi, charges)) +
  geom_point(alpha = 0.5, color = "firebrick") +
  geom_smooth(method = "lm", color = "black") +
  labs(title = "Regressão: valor cobrado ~ IMC (somente fumantes)", x = "IMC", y = "Valor cobrado (US$)") + tema
ggsave("graficos/08_reg_bmi_fumantes.png", g8, width = 8, height = 5)

png("graficos/09_residuos_m1.png", width = 900, height = 450)
par(mfrow = c(1, 2))
plot(m1, which = 1)
plot(m1, which = 2)
dev.off()

# Conclusão
# A idade tem relação positiva com o valor cobrado: quanto mais velho o
# segurado, maior tende a ser o custo. O IMC, sozinho, explica pouco da
# variação (R² baixo), então não é um bom preditor para todos os clientes.
# Já entre os fumantes, o IMC passa a explicar bem mais o valor cobrado,
# o que mostra que fumar muda a relação entre IMC e custo. Para a
# seguradora, faz sentido precificar os planos separando o perfil de
# fumantes e não fumantes, e considerando a idade. Como os modelos são
# simples (uma variável só), um próximo passo seria usar regressão
# múltipla para combinar idade, IMC e condição de fumante.
