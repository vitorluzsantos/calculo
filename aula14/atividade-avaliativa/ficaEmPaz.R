set.seed(123)

#------------Plano Fique em Paz-----------------#
#O plano Fique em Paz tem 189.000 conveniados em todo Brasil,
#segundo a Agência Nacional de Saúde, 34,3% de todos os conveniados de planos
#de saúde de todo o Brasil residem no estado de São Paulo
conveniados_sp <- 189000 * 0.343
conveniados_sp

#Desse total de conveniados do estado de São Paulo são estimadas 
#32% de pessoas afetadas que precisarão de atendimento
conveniados_afetados <- conveniados_sp * 0.32
conveniados_afetados
#Desses conveniados afetados, 38% estão nas faixas etárias analisadas
#(7 a 17 anos) e (55 a 82 anos)
taxa_idade <- conveniados_afetados * 0.38;
taxa_idade
#Da faixa etária analisada, 61,5% são jovens de 7 a 17 anos e 38.5% são idosos.
porcentagem_jovens <- 61.5;
porcentagem_idosos <- 38.5;
#Número de conveniados de 7 a 17 anos no estado
conveniados_jovens <- taxa_idade * 0.615
#Número de conveniados de 55 a 82 anos no estado
conveniados_idosos <- taxa_idade * 0.385;

amostra <- data.frame(conveniados_jovens,
                      conveniados_idosos)

idades_idosos <- pmin(pmax(round(rnorm( n = conveniados_idosos, mean = 68.5, sd = 8),0),55),82)

idades_jovens <- pmin(pmax(round(rnorm(n = conveniados_jovens, mean = 13.2, sd = 3), 0),7),17)

hist(c(idades_jovens, idades,
     main = "Idades jovens",
     xlab = "Idades",
     ylab = "Frequência")

hist(idades_idosos,
     main = "Idades idosos",
     xlab = "Idades",
     ylab = "Frequência")

# 1. Qual a média de idade com maior número de atendimentos médicos?
# a. Utilize histogramas ou densidades para identificar o pico da distribuição

# Consideramos que a frequência de idades é equivalente a atendimento, ou seja, 
# 1 pessoa = 1 atendimento, então são 7884 atendimentos
idades_atendidos <- c(idades_jovens, idades_idosos)

frequencia <- table(idades_atendidos)

idades_pico <- as.numeric(names(which.max(frequencia)))
maior_numero_atendimentos <- max(frequencia)

idades_pico
maior_numero_atendimentos

hist(idades_atendidos,
     main = "Distribuição de atendimentos por idade",
     
     # Divisões das idades, 6 -> 7; 7 -> 8 ... 81 -> 82 (assim, cada barra fica associada a uma idade)
     breaks = seq(6, 82, by = 1),
     xlab = "Idade",
     ylab = "Número de atendimentos")

plot(
  density(idades_idosos),
  main = "Distribuição das idades - Idosos",
  xlab = "Idade",
  ylab = "Densidade"
)

plot(
  density(idades_jovens),
  main = "Distribuição das idades - Idosos",
  xlab = "Idade",
  ylab = "Densidade"
)

# 2. Quais faixas etárias necessitam de maior número de atendimentos médicos?
faixas <- ifelse(
  idades_atendidos <= 12, "7 a 12",
  ifelse(
    idades_atendidos <= 17, "13 a 17",
    ifelse(
      idades_atendidos <= 64, "55 a 64",
      "65 a 82"
    )
  )
)

faixas <- factor(
  faixas,
  levels = c("7 a 12", "13 a 17", "55 a 64", "65 a 82")
)

frequencia_faixas <- table(faixas)

barplot(
  frequencia_faixas,
  main = "Número de atendimentos por faixa etária",
  xlab = "Faixa etária",
  ylab = "Número de atendimentos"
)

faixa_maior <- names(which.max(frequencia_faixas))
maior_frequencia <- max(frequencia_faixas)

faixa_maior
maior_frequencia