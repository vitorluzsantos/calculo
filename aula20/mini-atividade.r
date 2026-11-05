df_advertising <- read.csv("datassets/advertising.csv")

# correlacao forte positiva 0.54
cor(df_advertising$TV, df_advertising$Radio)

# correlacao forte positiva 0.56
cor(df_advertising$TV, df_advertising$Newspaper)

# correlacao forte positiva 0.9
cor(df_advertising$TV, df_advertising$Sales)

regressao <- lm(Sales ~ TV + Newspaper, data = df_advertising)
summary(regressao)

summary(regressao)

library(ggplot2)
ggplot(df_advertising, aes(TV, Sales))+
	geom_point(aes(colour = Newspaper), size = 2)+
	geom_smooth(method = "lm",
		se = FALSE,
		colour = "red")

# a propaganda na tv potencializa as vendas, e a no jornal que são as cores não muda praticamente nada
