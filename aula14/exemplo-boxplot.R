iris <- datasets::iris

boxplot(
	iris$Petal.Length[iris$Species == "virginica"],
	iris$Petal.Length[iris$Species == "setosa"],
	iris$Petal.Length[iris$Species == "versicolor"]
)

# se tiver uma variavel categorica como primeiro parametro ao inves de um grafico de dispersão ele ja vira um boxplot
plot(iris$Species, iris$Petal.Length)
