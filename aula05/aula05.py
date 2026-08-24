import psutil as p

print(p.cpu_percent(interval=1))
print(p.cpu_percent(interval=None)) # o None usa o tempo de intervalo do comando anterior
print(p.cpu_percent(interval=1, percpu=True))

print("Comando para ver a contagem de CPUs: ")
print(p.cpu_count())

print("Comando para ver a frequência da CPU")
print(p.cpu_freq(percpu=True))





