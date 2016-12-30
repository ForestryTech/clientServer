require 'socket'

host = 'localhost'
port = 2000
path = "/index.htm"

#This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
#Split response at frst blank line into headers and body
headers, body = response.split("\r\n\r\n", 2)
print body