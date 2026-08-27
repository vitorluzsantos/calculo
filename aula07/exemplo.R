a <- 1
b <- 40

# num diferente de zero é true
if(c <- 0){
	"teste 1"
} else{
	"teste2"
}
# rode as funções no final dela por que se voce rodar na linha de print ele só printa

somar <- function(num1, num2 = 10){
	cat(num1 + num2)
}

somar(2, 42)
somar(2)

# pra criar um vetor usasse o "c()"
nomes <- c("tom", "bob", "mel", "dan")

# no R o indice comeca no 1 ao inves do 0
nomes[1]

# no R o for é normal mas quase nunca é utilizado por que o R tem muitas funções que abstraem laços de repetição
for (nome in nomes) {
	cat(nome, "\n")
}

