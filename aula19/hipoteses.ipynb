# ==============================================================
# Hipótese do grupo: o alongamento dinâmico aumenta a flexibilidade?
# H0: média das diferenças (depois - antes) <= 0
# H1: média das diferenças (depois - antes) >  0   (teste unilateral)
# Teste: t pareado, alpha = 0,05
# Base: Yan et al. (2025) - média antes = 19,21 cm, DP = 7,02 cm, n = 23
# ==============================================================

set.seed(42)

alpha   <- 0.05
media_antes <- 19.21   # cm
dp_antes    <- 7.02    # cm
rho         <- 0.80    # ASSUMIDO: correlação entre antes e depois (o artigo não dá dados individuais)
dp_dif      <- sqrt(2 * dp_antes^2 * (1 - rho))  # DP das diferenças implicado por rho

# ---------- 1) Cenários (efeito = aumento médio real em cm) ----------
# Efeitos baseados nas médias da tabela: média depois - 19,21
cenarios <- data.frame(
  nome   = c("Controle (0 min)", "Sem efeito", "DS 0 min", "DS 5 min",
             "DS 15 min", "Efeito grande, n=23", "DS 0 min, n=100"),
  efeito = c(-0.21,              0.00,         1.69,       1.76,
             2.27,              4.00,                     1.69),
  n      = c(23, 23, 23, 23, 23, 23, 100),
  stringsAsFactors = FALSE
)

# ---------- 2) Geração dos dados (distribuição normal) ----------
gerar_dados <- function(n, efeito) {
  antes <- rnorm(n, mean = media_antes, sd = dp_antes)
  # diferença individual ~ Normal(efeito, dp_dif)
  depois <- antes + rnorm(n, mean = efeito, sd = dp_dif)
  data.frame(antes = antes, depois = depois)
}

# ---------- 3) Plot da distribuição t com a região crítica (RC) ----------
plotar_rc <- function(res, titulo) {
  gl   <- unname(res$parameter)
  tcrit <- qt(1 - alpha, gl)
  tobs  <- unname(res$statistic)

  lim <- max(4, abs(tobs) + 0.5)
  x <- seq(-lim, lim, length.out = 500)
  y <- dt(x, gl)

  plot(x, y, type = "l", lwd = 2, xlab = "t", ylab = "densidade",
       main = titulo, cex.main = 0.9)
  # RC: cauda direita (t >= tcrit)
  xr <- seq(tcrit, lim, length.out = 100)
  polygon(c(tcrit, xr, lim), c(0, dt(xr, gl), 0),
          col = rgb(1, 0, 0, 0.4), border = NA)
  abline(v = tcrit, lty = 2, col = "red")
  abline(v = tobs,  lwd = 2, col = "blue")
  legend("topleft", bty = "n", cex = 0.7,
         legend = c(sprintf("t crítico = %.2f", tcrit),
                    sprintf("t obs = %.2f", tobs),
                    sprintf("p = %.4f", res$p.value)),
         col = c("red", "blue", NA), lty = c(2, 1, NA), lwd = c(1, 2, NA))
}

# ---------- 4) Teste, plot e interpretação de cada cenário ----------
par(mfrow = c(3, 3))
resultados <- data.frame()

for (i in seq_len(nrow(cenarios))) {
  d <- gerar_dados(cenarios$n[i], cenarios$efeito[i])

  # Teste t pareado unilateral: H1 = depois > antes
  res <- t.test(d$depois, d$antes, paired = TRUE, alternative = "greater")

  plotar_rc(res, sprintf("%s (efeito real = %.2f cm)", cenarios$nome[i], cenarios$efeito[i]))

  decisao <- ifelse(res$p.value < alpha, "Rejeita H0", "Não rejeita H0")
  resultados <- rbind(resultados, data.frame(
    cenario  = cenarios$nome[i],
    n        = cenarios$n[i],
    efeito_real = cenarios$efeito[i],
    dif_media_amostral = round(unname(res$estimate), 2),
    t        = round(unname(res$statistic), 3),
    p_valor  = round(res$p.value, 4),
    decisao  = decisao
  ))

  cat("\n----", cenarios$nome[i], "----\n")
  print(res)
  if (res$p.value < alpha) {
    cat("Interpretação: p <", alpha, "-> rejeitamos H0. Há evidência estatística de que o",
        "alongamento aumentou a flexibilidade.\n")
  } else {
    cat("Interpretação: p >=", alpha, "-> não rejeitamos H0. Não há evidência estatística",
        "suficiente de aumento da flexibilidade.\n")
  }
}

par(mfrow = c(1, 1))
cat("\n===== RESUMO DOS CENÁRIOS =====\n")
print(resultados, row.names = FALSE)

# ---------- 5) Extra: repetindo 1000 vezes (taxa de erro tipo I e poder) ----------
# Mostra na prática o que são erro tipo I e tipo II.
repetir <- function(n, efeito, B = 1000) {
  rejeicoes <- replicate(B, {
    d <- gerar_dados(n, efeito)
    t.test(d$depois, d$antes, paired = TRUE, alternative = "greater")$p.value < alpha
  })
  mean(rejeicoes)
}

cat("\n===== 1000 simulações por cenário =====\n")
cat("Efeito = 0 (H0 verdadeira): rejeitou H0 em",
    repetir(23, 0) * 100, "% das vezes -> erro tipo I (~5%)\n")
cat("Efeito = 1,69 cm, n=23 (H1 verdadeira): rejeitou H0 em",
    repetir(23, 1.69) * 100, "% das vezes -> poder; o resto é erro tipo II\n")
cat("Efeito = 1,69 cm, n=100: rejeitou H0 em",
    repetir(100, 1.69) * 100, "% das vezes -> poder\n")
