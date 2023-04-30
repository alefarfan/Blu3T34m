
import sys
import socket

ip = '192.168.0.1' 
puerto_abierto =[] 

ports = range(1, 65535)

def probe_port(ip, port, result = 1): 
  try: 
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
    sock.settimeout(0.6) 
    r = sock.connect_ex((ip, port))   
    if r == 0: 
      res = r 
    sock.close() 
  except Exception as e: 
    pass 
  return res


for port in ports: 
    sys.stdout.flush() 
    response = probe_port(ip, port) 
    if response == 0: 
        puerto_abierto.append(port) 
    

if puerto_abierto: 
  print("Los puertos abiertos son: ") 
  print(sorted(puerto_abierto)) 
else: 
  print("No hay puertos abiertos")
