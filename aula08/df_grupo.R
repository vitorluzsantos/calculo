
dfVitor <- read.csv("./arquivosCaptura/captura_vitor.csv",
	header = FALSE,
	sep = ";",
	col.names = c(
		'TIMESTAMP', 'USUARIO', 'CPU_PERCENT', 'CPU_USER_PERCENT', 'CPU_NICE_PERCENT',
		'CPU_IDLE_PERCENT', 'CPU_IRQ_PERCENT', 'CPU_SOFTIRQ_PERCENT', 'CPU_STEAL_PERCENT',
		'CPU_GUEST_NIVE_PERCENT', 'CPU_FREQ_ATUAL', 'CPU_FREQ_MIN', 'CPU_FREQ_MAX', 'CPU_COUNT_LOGICA'
	)
)

dfRaphael <- read.csv("./arquivosCaptura/captura_raphael.csv",
	header = FALSE,
	sep = ";",
	col.names = c(
		'TIMESTAMP', 'USUARIO', 'CPU_PERCENT', 'CPU_USER_PERCENT', 'CPU_NICE_PERCENT',
		'CPU_IDLE_PERCENT', 'CPU_IRQ_PERCENT', 'CPU_SOFTIRQ_PERCENT', 'CPU_STEAL_PERCENT',
		'CPU_GUEST_NIVE_PERCENT', 'CPU_FREQ_ATUAL', 'CPU_FREQ_MIN', 'CPU_FREQ_MAX', 'CPU_COUNT_LOGICA'
	)
)

dfMatheus <- read.csv("./arquivosCaptura/captura_matheus.csv",
	header = FALSE,
	sep = ";",
	col.names = c(
		'TIMESTAMP', 'USUARIO', 'CPU_PERCENT', 'CPU_USER_PERCENT', 'CPU_NICE_PERCENT',
		'CPU_IDLE_PERCENT', 'CPU_IRQ_PERCENT', 'CPU_SOFTIRQ_PERCENT', 'CPU_STEAL_PERCENT',
		'CPU_GUEST_NIVE_PERCENT', 'CPU_FREQ_ATUAL', 'CPU_FREQ_MIN', 'CPU_FREQ_MAX', 'CPU_COUNT_LOGICA'
	)
)

dfLivia <- read.csv("./arquivosCaptura/captura_livia.csv",
	header = FALSE,
	sep = ";",
	col.names = c(
		'TIMESTAMP', 'USUARIO', 'CPU_PERCENT', 'CPU_USER_PERCENT', 'CPU_NICE_PERCENT',
		'CPU_IDLE_PERCENT', 'CPU_IRQ_PERCENT', 'CPU_SOFTIRQ_PERCENT', 'CPU_STEAL_PERCENT',
		'CPU_GUEST_NIVE_PERCENT', 'CPU_FREQ_ATUAL', 'CPU_FREQ_MIN', 'CPU_FREQ_MAX', 'CPU_COUNT_LOGICA'
	)
)

dfCarlos <- read.csv("./arquivosCaptura/captura_carlos.csv",
	header = FALSE,
	sep = ";",
	col.names = c(
		'TIMESTAMP', 'USUARIO', 'CPU_PERCENT', 'CPU_USER_PERCENT', 'CPU_NICE_PERCENT',
		'CPU_IDLE_PERCENT', 'CPU_IRQ_PERCENT', 'CPU_SOFTIRQ_PERCENT', 'CPU_STEAL_PERCENT',
		'CPU_GUEST_NIVE_PERCENT', 'CPU_FREQ_ATUAL', 'CPU_FREQ_MIN', 'CPU_FREQ_MAX', 'CPU_COUNT_LOGICA'
	)
)

dfGrupo = rbind(dfVitor, dfLivia, dfCarlos, dfRaphael, dfMatheus)

dfGrupo$STATUS_CPU <- ifelse(dfGrupo$CPU_PERCENT < 40, "BOM", "RUIM")
# histograma <- não é um grafico de barras (histograma não tem espaço entre as barras por que voce analisa o intervalo)
hist(dfGrupo$CPU_COUNT_LOGICA)

# printa o grafico de barras com os dados convertido
barplot(table(dfGrupo$STATUS_CPU))

# definindo nome do plot
hist( main = "Histograma de uso de CPU", # titulo do plot 
	dfGrupo$CPU_FREQ_MIN, # dado a ser plotado
	xlab = "CPU", # legenda
	ylab = "Frequencia", # legenda
	col = "#ff1299" # cor das barras
)

# plot serve pra ver a disperçao e relação entre variaveis
plot(dfGrupo$CPU_FREQ_MAX, dfGrupo$CPU_FREQ_MIN)


