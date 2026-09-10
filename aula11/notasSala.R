
dfTurma <- read.csv("notas.csv",
	header = TRUE,
	sep = ";"
)

# Seu código anterior...
dfTurma$mediaFinal <- ((dfTurma$Entrega.01 + dfTurma$Entrega.02 + dfTurma$Entrega.03 + dfTurma$Integrada + dfTurma$Pratica)/5)

# 1. Gerar o gráfico de dispersão com limites no eixo Y de 0 a 10 (ideal para notas)
plot(dfTurma$mediaFinal, 
     pch = 19, 
     col = "darkblue", 
     ylim = c(0, 10),
     xlab = "Alunos (Índice)", 
     ylab = "Média Final", 
     main = "Dispersão das Notas com Média e Desvio Padrão")

# 2. Calcular a média e o desvio padrão da média final
m_final <- mean(dfTurma$mediaFinal)
sd_final <- sd(dfTurma$mediaFinal)

# 3. Adicionar a linha da MÉDIA (Linha vermelha sólida)
abline(h = m_final, col = "red", lwd = 2)

# 4. Adicionar as linhas do DESVIO PADRÃO (Linhas vermelhas tracejadas)
# Mostra o intervalo onde a maioria das notas se concentra
abline(h = m_final + sd_final, col = "red", lty = 2, lwd = 1.5)
abline(h = m_final - sd_final, col = "red", lty = 2, lwd = 1.5)

# 5. Adicionar uma legenda para quem for olhar o gráfico entender
legend("bottomleft", 
       legend = c("Notas", "Média", "Média ± 1 DP"), 
       col = c("darkblue", "red", "red"), 
       pch = c(19, NA, NA), 
       lty = c(NA, 1, 2), 
       lwd = c(NA, 2, 1.5))
