# exemplos operadores logicos

a = True
b = False

print("AND:", a and b)
print("OR:", a or b)
print("NOT a", not a);
print("NOT b", not b);

# variaveis
cidade = "São Paulo"
rua = "Rua Haddock Lobo"
numero = 595
nota_mec = 5.0
aberto = True

# str                             Texto => Cadeia de caractres( strings)
# int, float, complex             Numéricos => Números inteiros, decimais e complexos
# list, tuple, range              Coleções  => ordenadas de elementos
# dict                            Mapeamento => Pares chave-valor
# set, frozenset                  Conjunto => coleçoes não ordenadas de valores únicos
# bool                            Booleano => valores lógicos (True ou False)
# bytes, bytearray, memoryview    Dados em fomato de bytes

#transformadores

#comeca str termina int
string_numero = "123"
numero_inteiro = int(string_numero)

#comeca str termina float
string_numero = "3.14"
numero_float = float(string_numero)

#comeca int termina str
idade_inteiro = 30
idade_string = str(idade_inteiro)

#comeca float termina str
preco_decimal = 99.99
preco_string = str(preco_decimal)

#decisao
ceu = "vermelho"
if ceu == "azul":
    print("ceu azul")