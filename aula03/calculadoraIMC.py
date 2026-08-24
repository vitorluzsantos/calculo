while True:
    peso = float(input("Digite o seu peso: "))
    altura = float(input("Digite a sua altura: "))

    imc = peso/(altura**2)

    if(imc < 18.5):
        print(f"Seu IMC é {imc:.2f} - Abaixo do peso normal")
    elif(imc < 24.9):
        print(f"Seu IMC é {imc:.2f} - Peso normal")
    elif(imc < 29.9):
        print(f"Seu IMC é {imc:.2f} - Excesso de peso")
    elif(imc < 34.9):
        print(f"Seu IMC é {imc:.2f} - Obesidade grau 1")
    elif(imc < 39.9):
        print(f"Seu IMC é {imc:.2f} - Obesidade grau 2")
    else:
        print(f"Seu IMC é {imc:.2f} - Obesidade Mórbida")
    continuar = input("Deseja calcular o IMC de outra pessoa? (s/n): ")
    if(continuar == "s"):
        continue
    elif(continuar == "n"):
        break
