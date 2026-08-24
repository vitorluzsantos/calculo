import psutil as p
import csv
import time
# import os
from datetime import datetime

cabecalho = [
'TIMESTAMP',
'USUARIO',

'CPU_PERCENT',
'CPU_USER_PERCENT', # Porcentagem da CPU executando programas/processos do usuário
'CPU_SYSTEM_PERCENT', # Porcentagem da CPU executando tarefas do sistema operacional
'CPU_IDLE_PERCENT', # Porcentagem do tempo que a CPU ficou ociosa

'RAM_PERCENT',
'RAM_USADA', # Quantidade de memória que o sitema considera em uso
'RAM_LIVRE', # Quantidade de memória que está sem uso no momento
'RAM_ATIVA', # Quantidade de memória ram disponível para uso sem começar a utilizar a swap

'SWAP_USADA', # Quantidade de memória swap que o sistem considera em uso
'SWAP_LIVRE', # Quantidade de memória swap que está sem uso no momento

'DISCO_PERCENT',
'DISCO_USADO',
'DISCO_LIVRE'
]

user = 'raphael'
while True:
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    cpu_perc = p.cpu_percent(interval=1)
    cpu_times = p.cpu_times_percent(interval=1)

    disco = p.disk_usage('/')
    ram = p.virtual_memory()
    swap = p.swap_memory()

    dados = [
    timestamp,
    user,

    cpu_perc,
    cpu_times.user,
    cpu_times.system,
    cpu_times.idle,

    ram.percent,
    ram.active,
    ram.free,

    swap.used,
    swap.free,

    disco.percent,
    disco.used,
    disco.free
    ]

    with open('./captura_raphael.csv', 'a') as csvfile:
        csv.writer(csvfile, delimiter=';').writerow(dados)
    time.sleep(2)

