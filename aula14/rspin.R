#' # Relatório de teste
#'
#' Esse arquivo é só pra testar o `<leader>rk`, que roda `knitr::spin()`
#' e gera um `.Rmd` a partir daqui.

#+ setup, echo=TRUE
x <- rnorm(100, mean = 5, sd = 2)
summary(x)

#' Agora um histograma simples da distribuição gerada acima:

#+ histograma, fig.width=6, fig.height=4
hist(x, main = "Distribuição de x", col = "steelblue", border = "white")

#' E uma tabelinha rápida com algumas estatísticas:

#+ estatisticas
data.frame(
  media = mean(x),
  desvio_padrao = sd(x),
  minimo = min(x),
  maximo = max(x)
)
