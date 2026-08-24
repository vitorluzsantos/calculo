import psutil

cpu = psutil.cpu_percent(0.1) # porcentagem de utilizacao da cpu
print(cpu)

print()
disk = psutil.disk_usage("/") # mostra o espaco em disco do diretorio / 
print(disk)

print()
ram = psutil.virtual_memory()
print(ram)

