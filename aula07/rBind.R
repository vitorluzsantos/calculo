# rbind junta dois dataframes
# read.csv() <- le um arquivo csv 

dfVitor <- read.csv("arquivosCaptura/captura_vitor.csv",
	header = FALSE,
	sep = ";",
	col.names = c("timestamp", "user", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
)

dfLivia <- read.csv("arquivosCaptura/captura_livia.csv",
	header = FALSE,
	sep = ";",
	col.names = c("timestamp", "user", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
)

dfRaphael <- read.csv("arquivosCaptura/captura_raphael.csv",
	header = FALSE,
	sep = ";",
	col.names = c("timestamp", "user", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
)

dfCarlos <- read.csv("arquivosCaptura/captura_carlos.csv",
	header = FALSE,
	sep = ";",
	col.names = c("timestamp", "user", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
)

dfMatheus <- read.csv("arquivosCaptura/captura_matheus.csv",
	header = FALSE,
	sep = ";",
	col.names = c("timestamp", "user", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
)

dfGeral <- rbind(dfVitor, dfMatheus, dfCarlos, dfRaphael, dfLivia)

head(dfGeral)
rm(df)

