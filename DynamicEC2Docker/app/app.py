import socket

print("Hello from DOcker app inside Jenkins pipeline!")

try:
    backend_ip = socket.gethostbyname("backend-server")
    print(f"Backend server IP is: {backend_ip}")
except socket.gaierror:
    print("Could not resolve backend-server hostname")