library(ggplot2)

df_mouse <- read.csv("datassets/2026_06_28_MousedB.csv", sep = ";")

# 1. Conhecendo os dados
str(df_mouse)
summary(df_mouse)

# 2. Matriz de correlação
num <- df_mouse[sapply(df_mouse, is.numeric)]
num <- num[sapply(num, function(x) sd(x, na.rm = TRUE) > 0)]

mat_cor <- cor(num, use = "pairwise.complete.obs")
print(round(mat_cor, 2))

cor_long <- as.data.frame(as.table(mat_cor))
names(cor_long) <- c("var1", "var2", "r")

ggplot(cor_long, aes(x = var1, y = var2, fill = r)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(r, 2)), size = 3) +
  scale_fill_gradient2(low = "#B2182B", mid = "white", high = "#2166AC",
                       midpoint = 0, limits = c(-1, 1)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Matriz de correlação", x = NULL, y = NULL, fill = "r")

# 3. Escolha das variáveis
cor_abs <- abs(mat_cor)
diag(cor_abs) <- 0
idx <- which(cor_abs == max(cor_abs, na.rm = TRUE), arr.ind = TRUE)[1, ]
var_y <- rownames(mat_cor)[idx[1]]
var_x <- colnames(mat_cor)[idx[2]]

cat("Variável explicativa (x):", var_x, "\n")
cat("Variável resposta (y):", var_y, "\n")

# 4. Regressão linear simples
modelo <- lm(reformulate(var_x, var_y), data = df_mouse)
summary(modelo)

r2 <- summary(modelo)$r.squared
r  <- cor(df_mouse[[var_x]], df_mouse[[var_y]], use = "complete.obs")
cat("Coeficiente de correlação (r):", round(r, 4), "\n")
cat("Coeficiente de determinação (R²):", round(r2, 4), "\n")

# 5. Dispersão com reta de regressão
ggplot(df_mouse, aes(x = .data[[var_x]], y = .data[[var_y]])) +
  geom_point(color = "#2166AC", alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, color = "#B2182B") +
  theme_minimal() +
  labs(title = paste("Regressão linear:", var_y, "~", var_x),
       subtitle = paste("R² =", round(r2, 3)),
       x = var_x, y = var_y)

# 6. Resíduos
df_res <- data.frame(ajustado = fitted(modelo), residuo = resid(modelo))

ggplot(df_res, aes(x = ajustado, y = residuo)) +
  geom_point(color = "#2166AC", alpha = 0.7) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "#B2182B") +
  theme_minimal() +
  labs(title = "Resíduos x valores ajustados",
       x = "Valores ajustados", y = "Resíduos")

# 7. Conclusão
coefs  <- coef(summary(modelo))
slope  <- coefs[2, 1]
p_val  <- coefs[2, 4]
forca  <- if (abs(r) >= 0.7) "forte" else if (abs(r) >= 0.4) "moderada" else "fraca"
signif <- if (p_val < 0.05) "é" else "não é"

cat("\nCONCLUSÃO\n")
cat("- ", var_x, " e ", var_y, " têm correlação ", forca,
    " (r = ", round(r, 3), ").\n", sep = "")
cat("- A cada aumento de 1 unidade em ", var_x, ", ", var_y,
    " varia em média ", round(slope, 3), " unidades (p-valor = ",
    format.pval(p_val, digits = 3), "), então a relação ", signif,
    " estatisticamente significativa.\n", sep = "")
cat("- R² = ", round(r2, 3), ": ", round(r2 * 100, 1),
    "% da variação de ", var_y, " é explicada por ", var_x, ".\n", sep = "")
