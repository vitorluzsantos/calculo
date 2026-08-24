import csv
import time
from datetime import datetime, timedelta


def media(valores):
    valores = list(valores)
    return sum(valores) / len(valores) if valores else None

USUARIOS = ['vitor', 'raphael', 'livia', 'matheus', 'carlos', 'marcelly']
PASTA_CAPTURA = '../captura'

COLUNAS = [
    'TIMESTAMP',
    'USUARIO',
    'CPU_PERCENT',
    'CPU_USER_PERCENT',
    'CPU_SYSTEM_PERCENT',
    'CPU_IDLE_PERCENT',
    'RAM_PERCENT',
    'RAM_ATIVA',
    'RAM_LIVRE',
    'SWAP_USADA',
    'SWAP_LIVRE',
    'DISCO_PERCENT',
    'DISCO_USADO',
    'DISCO_LIVRE',
]

CAMPOS_NUMERICOS = COLUNAS[2:]  


def ler_csv(caminho):
    registros = []
    with open(caminho, 'r') as csvfile:
        reader = csv.reader(csvfile, delimiter=';')
        for linha in reader:
            if not linha:
                continue
            registro = dict(zip(COLUNAS, linha))
            registro['TIMESTAMP'] = datetime.strptime(
                registro['TIMESTAMP'], '%Y-%m-%d %H:%M:%S'
            )
            for campo in CAMPOS_NUMERICOS:
                registro[campo] = float(registro[campo])
            registros.append(registro)
    return registros


def filtrar_por_periodo(registros, minutos):
    if not registros:
        return []
    limite = registros[-1]['TIMESTAMP'] - timedelta(minutes=minutos)
    return [r for r in registros if r['TIMESTAMP'] >= limite]


def media_ram_ultima_hora(registros):
    recentes = filtrar_por_periodo(registros, 60)
    return media(r['RAM_PERCENT'] for r in recentes)


def pico_cpu(registros, minutos=None):
    dados = filtrar_por_periodo(registros, minutos) if minutos else registros
    return max(dados, key=lambda r: r['CPU_PERCENT']) if dados else None


def media_disco(registros, minutos):
    recentes = filtrar_por_periodo(registros, minutos)
    return media(r['DISCO_PERCENT'] for r in recentes)


def ociosidade_media_cpu(registros):
    return media(r['CPU_IDLE_PERCENT'] for r in registros)


def variacao_ram(registros):
    if not registros:
        return None
    valores = [r['RAM_PERCENT'] for r in registros]
    return max(valores) - min(valores)


def gerar_relatorio(usuario, registros):
    print(f'\n=== Relatório de {usuario} ===')
    print(f'Total de registros: {len(registros)}')

    media_ram = media_ram_ultima_hora(registros)
    if media_ram is not None:
        print(f'Uso médio de RAM na última hora: {media_ram:.2f}%')
    else:
        print('Sem dados de RAM na última hora')

    pico = pico_cpu(registros)
    if pico:
        print(f"Pico de uso de CPU: {pico['CPU_PERCENT']:.1f}% às {pico['TIMESTAMP']}")

    media_disco_10min = media_disco(registros, 10)
    if media_disco_10min is not None:
        print(f'Média de uso de disco (últimos 10 min): {media_disco_10min:.2f}%')
    else:
        print('Sem dados de disco nos últimos 10 min')

    ociosidade = ociosidade_media_cpu(registros)
    if ociosidade is not None:
        print(f'Ociosidade média da CPU: {ociosidade:.2f}%')

    var_ram = variacao_ram(registros)
    if var_ram is not None:
        print(f'Variação de uso de RAM (máx - mín): {var_ram:.2f} p.p.')


INTERVALO_SEGUNDOS = 60

while True:
    for usuario in USUARIOS:
        caminho = f'{PASTA_CAPTURA}/captura_{usuario}.csv'
        try:
            registros = ler_csv(caminho)
        except FileNotFoundError:
            print(f'\nArquivo não encontrado para {usuario}: {caminho}')
            continue
        gerar_relatorio(usuario, registros)
    time.sleep(INTERVALO_SEGUNDOS)
