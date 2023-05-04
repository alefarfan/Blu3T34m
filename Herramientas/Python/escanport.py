
import sys
import socket

ip = '192.168.1.1' 
puertos_abiertos =[] 

ports = range(10, 55)

def probar_puertos(ip, port, resultado = 1): 
  try: 
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
    sock.settimeout(0.6) 
    r = sock.connect_ex((ip, port))   
    if r == 0: 
      resultado = r 
    sock.close() 
  except Exception as e: 
    pass 
  return resultado


for port in ports: 
    sys.stdout.flush() 
    response = probar_puertos(ip, port) 
    if response == 0: 
        puertos_abiertos.append(port) 
    

if puertos_abiertos: 
  print("Los Puertos abiertos son: ") 
  print(sorted(puertos_abiertos)) 
else: 
  print("no hay puertos abiertos")
