import socket
import sys

ip = sys.argv[1]
for port in range(65535):
    try:
        serv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        serv.settimeout(1)  
        serv.connect((ip, port))  
        print('[OPEN] Port open:', port)
        serv.close()  
    except socket.error:
        pass
