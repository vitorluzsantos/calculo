import psutil
import csv
import os
from datetime import datetime

timestamp = datetime.now().timestamp()
formatTimestamp = datetime.fromtimestamp(timestamp).strftime('%d/%m/%Y %H:%M:%S')


cpu = psutil.cpu_percent(0.1) # porcentagem de utilizacao da cpu

disk = psutil.disk_usage("/") # mostra o espaco em disco do diretorio / 

ram = psutil.virtual_memory()

print(formatTimestamp)
print(cpu)
print(disk.percent)
print(ram.percent)

if(not os.path.exists('coleta_dados.csv')):
    with open('./coleta_dados.csv', 'w') as csvfile:
        csv.writer(csvfile, delimiter=';').writerow(['timestamp','cpu','ram','disco'])
with open('./coleta_dados.csv', 'a') as csvfile:
    csv.writer(csvfile, delimiter=';').writerow([formatTimestamp,cpu,disk.percent,ram.percent]); 
