#operações matematicas

print('\n'*2)

# atribuir valores inteiros a duas variaveis

a = 6
b = 3

# vamos fazer operações mais elaboradas
# usando as 4 operações simples

soma = a + b
subtracao = a - b
multiplicacao = a * b
divisao = a / b

print("mostrar os resultados")

print("a = ", a)
print("b = ", b)
print("a + b = ", soma)
print("a - b = ", subtracao)
print("a * b = ", multiplicacao)
print("a / b = ", divisao)

# o que podemos observar em relação aos numeros inteiros e a saida resultante da divisao 

# o valor passa a ser float ele vira 2.0

print ('\n'*2)

a1 = 6.5
b1 = 2.5

# vamos fazer operações mais elaboradas
# usando as 4 operações simples

soma = a1 + b1
subtracao = a1 - b1
multiplicacao = a1 * b1
divisao = a1 / b1 

print("mostrar resultados")

print("a1 = ", a1)
print("b1 = ", b1)
print("a1 + b1 = ", soma)
print("a1 - b1 = ", subtracao)
print("a1 * b1 = ", multiplicacao)
print("a1 / b1 = ", divisao)

# se housver algum erro apontado pelo interpretador nas operações corrija
# deu um erro por conta da virgula usada para definir o ponto flutuante então eu troquei por ponto

# exercicio 1

# crie um programa em python que
# atribua o valor 2 a uma variavel chamada a 
# calcule
#   potencia_ao_quadrado como a elevado ao quadrado 
#   potencia_ao_cubo como a elevado ao cubo 
#   potencia_a_quarta como a elevado a quarta potencia 
# imprima osresultados no seguinte formato

# desafio => use a f-string para calcular e imprimir o valor diretamente

a = 2
potencia_ao_quadrado = a**2
potencia_ao_cubo = a**3
potencia_a_quarta = a**4

print("Potência ao quadrado: ", potencia_ao_quadrado)
print("Potência ao cubo: ", potencia_ao_cubo)
print("Potência à quarta: ", potencia_a_quarta)

# desafio
print(f"Potência ao quadrado: {a**2}")
print(f"Potência ao cubo: {a**3}")
print(f"Potência à quarta: {a**4}")

# exercicio 2 

# crie um programa em python que 
# importe a função pow do modulo math
# atribua valores para duas variaveis
#   c (ex : 4)
#   d (ex : 5)
# calcule usando pow() e armazene em variavieis:
#   c_elevado_ao_quadrado -> c ^ 2
#   c_elevado_ao_cubo -> c ^ 3
#   c_elevado_a_quarta -> c ^ 4
#   c_elevado_a_d -> c ^ d
# exiba os resultados com mensagens no formato 
#   c elevado ao quadrado = <valor>
#   c elevado ao cubo = <valor>
#   c elevado a quarta = <valor>
#   c elevado a d = <valor>

# desafio => permita que o usuario digite os valores de c e d em vez de fixalos no codigo

import math

c = int(input("Digite o valor de c:"))
d = int(input("Digite o valor de d:"))

c_elevado_ao_quadrado = pow(c,2)
c_elevado_ao_cubo = pow(c,3)
c_elevado_a_quarta = pow(c,4)
c_elevado_a_d = pow(c,d)

print(f"c elevado ao quadrado = {c_elevado_ao_quadrado} ")
print(f"c elevado ao cubo = {c_elevado_ao_cubo} ")
print(f"c elevado a quarta = {c_elevado_a_quarta} ")
print(f"c elevado a d = {c_elevado_a_d} ")

# exercicio 3

# faça um codigo em python 
# cria uma variavel x = 512
# calcule 
#   raiz_quadrada_de_x = 
#   raiz_cubica_de_x = 
#   raiz_quarta_de_x = 
# imprima o resultado das strings

x = 512

raiz_quadrada_de_x = x ** (1 / 2)
raiz_cubica_de_x = x ** (1 / 3)
raiz_quarta_de_x = x ** (1 / 4)

print(f"raiz quadrada de x: {raiz_quadrada_de_x}")
print(f"raiz cubica de x: {raiz_cubica_de_x}")
print(f"raiz quarta de x: {raiz_quarta_de_x}")

# piso e teto 
#   o piso salarial é o menor valor de salario que pode ser pago a uma categoria profissional por sua jornada de trabalho. ja o teto slaarial é o maior salario que pode ser pago para realização de dado serviço. é o oposto de piso salarial
# dado um salario w = 3345.51 qual o seu teto e piso salario
# para responder a esta qeustão que podera ser muito util para numeros decimais tambem, vamos usar três funções do python:
#   floor (piso em ingles) - retorna o maior valor inteiro menor que w
#   ceil (teto em ingles) - retorna o menor valor inteiro maior que w
#   round(arredondamento em ingles) - retorna o valor inteiro mais proximo de a 

# exercicio 4

# dado o valor de w anteriormente, import as funções floor, ceil da biblioteca math e determine o piso, o teto e o arredondamento

w = 3345.61

print(f"o piso salarial de w é: {math.floor(w)}")
print(f"o teto salarial de w é: {math.ceil(w)}")
print(f"o teto arredondamento de w é: {round(w)}")

# exercicio 5 

# => teste a função round usando casas decimais, inclusive 0 casas
# => por que não importamos o round ?

teste = float(input("digite um valor para ser arredondado: "))
print(f"valor arredondado {round(teste)}")

# o round não é importado porque ele é uma função nativa do python

# exercicio 6

# arredonde os numeros a seguir, exibindo sem casas decimais:
#   x1 = 1.456
#   x2 = 3.678
#   x3 = 7.5

x1 = 1.456
x2 = 3.678
x3 = 7.5

print(f"x1 = {round(x1)}")
print(f"x2 = {round(x2)}")
print(f"x3 = {round(x3)}")

# exercicio 7

# voltando ao caso do floor e ceil, por padrão estas funçoes retornam valores inteiros. podemos determinar que os valores resultantes possuam ponto flutuante (float)

print('\n'*2)

resultado = math.floor(1.456)
print(resultado)
print(type(resultado))
resultado_float = float(math.floor(1.456))
print(resultado_float)
print(type(resultado_float))

# super exercicio 8

# resolva em python as expressoes a seguir 
# como voce resolveria essa lista
#
# 1. a ^ b = a * a * a (b vezes)
# 2. a ^ 0 = 1
# 3. a ^ 1 = a 
# 4. a ^ -b = 1/a^b, a != 0
# 5. a ^ b * a ^ c = a ^ (b + c)
# 6. (a ^ b) ^ c = a ^ (b * c)
# 7. (a ^ b) ^ c = a ^ (b * c)
# 8. (a / b) ^ c = (a ^ c)/(b ^ c), b != 0

a = 2 
b = 3 
c = 4

#1.
resultado = a ** b
print(f"1. {resultado}")

#2.
resultado = a ** 0
print(f"2. {resultado}")

#3.
resultado = a ** 1
print(f"3. {resultado}")

#4.
resultado = 1 / (a ** b)
print(f"4. {resultado}")
 
#5.
resultado = a ** (b + c)
print(f"5. {resultado}")

#6.
resultado = a ** (b - c)
print(f"6. {resultado}")

#7.
resultado = a ** (b * c)

#8.
resultado = (a ** c)/(b ** c)

# parte dois 

print(f"1. {2 ** 3}")
print(f"2. {(-2) ** 3}")
print(f"3. {1 ** 0}")
print(f"4. {(-1) ** 0}")
print(f"5. {2 ** 0}")
print(f"6. {(2 ** 3)/(5**3)}")
print(f"7. {1/(3 ** 2)}")
print(f"8. {2 ** 3}")
print(f"9. {(-1)**(3*4)}")
print(f"10. {(0.5)**3}")
print(f"11. {(0.25)**4}")
print(f"12. {0 ** 4}")
print(f"13. {1 + 0.41 ** 2}")
print(f"14. {0.25 + 5**2 - (0.5 ** 4)}")
print(f"15. {0.5 ** 3 + 4 ** 5}")
print(f"16. {((4/5) - 0.5 + 1)/0.5}")
