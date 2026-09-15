dfTurma <- read.csv("notas.csv",
	header = TRUE,
	sep = ";"
)


plot(dfTurma$mediaFinal, 
     pch = 19, 
     col = "darkblue", 
     ylim = c(0, 10),
     xlab = "Alunos (Índice)", 
     ylab = "Média Final", 
     main = "Dispersão das Notas com Média e Desvio Padrão")

m_final <- mean(dfTurma$mediaFinal)
sd_final <- sd(dfTurma$mediaFinal)

abline(h = m_final, col = "red", lwd = 2)

abline(h = m_final + sd_final, col = "red", lty = 2, lwd = 1.5)
abline(h = m_final - sd_final, col = "red", lty = 2, lwd = 1.5)

legend("bottomleft", 
       legend = c("Notas", "Média", "Média ± 1 DP"), 
       col = c("darkblue", "red", "red"), 
       pch = c(19, NA, NA), 
       lty = c(NA, 1, 2), 
       lwd = c(NA, 2, 1.5)
)

hist(dfTurma$Entrega.01)
hist(dfTurma$Entrega.02)
hist(dfTurma$Entrega.03)

# 1.
# as notas são proximas ou apresentão muita variação
# -> as notas são proximas 
# qual entrega apresentou maior dispersão
# -> entrega 3
# as distribuições parecem simétricas ou assimétricas
# -> simétricas
# a media parece representar bem as notas 
# -> sim
# ha indicios de uma distribuição aproximadamente normal?
# -> sim

hist(dfTurma$mediaFinal)
abline(v = mean(dfTurma$mediaFinal), lwd = 2)

# 2.
# qual teve a maior média?
# -> RA61
# qual apresentou maior desvio padrão?
sd(dfTurma$Entrega.01)
sd(dfTurma$Entrega.02)
sd(dfTurma$Entrega.03)
# -> entrega 3
# em qual a entrega a turma teve melhor desempenho ?
mean(dfTurma$Entrega.01)
mean(dfTurma$Entrega.02)
mean(dfTurma$Entrega.03)
# -> entrega 2
# em qual houve maior desigualdade entre as notas?
# -> pratica

# media final de cada aluno como coluna
dfTurma$mediaFinal <- ((dfTurma$Entrega.01 + dfTurma$Entrega.02 + dfTurma$Entrega.03 + dfTurma$Integrada + dfTurma$Pratica)/5)
