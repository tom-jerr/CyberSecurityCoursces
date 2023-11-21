import time
import socket

open_ports = []
def scan(target, port):
    # ConnectionRefusedError exception will be raised in case of a
    # closed port
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(0.1)
        sock.connect((target, port))
    except:
        return  # Terminate the function if there is an exception

    open_ports.append(port)

if __name__=='__main__':
    ip = "192.168.149.130"
    start = time.time()
    for i in range(1,501):
        scan(ip, i)
    end = time.time()
    for port in open_ports:
      print(f'port {port} open')
    spent = str(end-start)
    spent = spent[:spent.find('.')+3]
    print(f"\nCost {str(spent)} seconds")