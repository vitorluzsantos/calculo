nome = "carlos"
cor = "rosa"
idade = 18

print(nome,idade)

if(idade >= 18 and nome == "vitor"):
    print("pode dirigir vitao")
else:
    print(" é o " + nome + " no volante")

for i in range(5) :
    print(i + 1)

def isPar(valor:int):
    if(valor % 2 == 0):
        print("valor é par")
    else:
        print("valor é impar")

isPar(5)
