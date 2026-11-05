df_hospital <- read.csv("datassets/hospital.csv",)

# verificando se existe uma correlacao entre ciclismo e fumo 
cor(df_hospital$ciclismo, df_hospital$fumo)

regressao <- lm(df_hospital$problema_cardiaco ~ df_hospital$fumo + df_hospital$ciclismo)

summary(regressao)

# grafico bonitao
ggplot(df_hospital, aes(ciclismo, problema_cardiaco))+
	geom_point(aes(colour = fumo, size = 2))+
	geom_smooth(method = "lm",
							se = FALSE,
							colour = "red")
	
# grafico 3d
library(plotly)
plot_ly(df_hospital,
				x = ~fumo, 
				y = ~ciclismo
				z = ~problema_cardiaco
				color = ~fumo)
