#1. 

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


#2. 

mean(dfGrupo$CPU_USER_PERCENT)
dfGrupo[which.max(dfGrupo$CPU_USER_PERCENT),]
dfGrupo[which.min(dfGrupo$CPU_USER_PERCENT),]


#3.  
hist(
	main = "Histograma de uso de CPU", 
	dfGrupo$CPU_USER_PERCENT,
	xlab = "CPU", 
	ylab = "Frequencia", 
	col = "#38e" 
)

plot()
