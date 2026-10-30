df_aluno <- data.frame(
	nota = c(9, 8, 7, 10, 7, 4, 5, 6, 2),
	tempo_ia = c(9, 8, 7, 10, 7, 4, 5, 6, 2)
	# tempo_ia = c(2, 3, 1, 5, 3, 15, 13, 17, 40, 7)
)

correlacao <- cor(df_aluno$nota, df_aluno$tempo_ia)

regressao <- lm(df_aluno$nota ~ df_aluno$tempo_ia)
summary(regressao)

library(ggplot2)
ggplot(df_aluno, aes(tempo_ia, nota)) + geom_point() + geom_smooth(method = "lm", se = FALSE)

