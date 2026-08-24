# import psutil
import csv

with open('./coleta_dados.csv', 'r') as csvfile:
    for linha in csvfile:
        valores = linha.split(';')
        
        print("data do registro", valores[0])
        # print(valores)
