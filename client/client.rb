require 'socket'
require 'json'

#hostname = 'localhost'
#port = 2000

#s = TCPSocket.open(hostname, port)

host = 'localhost'
port = 2000
path = "/index.html"

#Get user request

bad_input = true
while bad_input
    puts "Press 1 if you want a GET, 2 if you want to POST: "
    ans = gets.chomp
    if ans === '1' || ans === '2'
        bad_input = false
    end
end    

bad_input = true
#This is the HTTP request we send to fetch a file
if ans === '1'
    request = "GET #{path} HTTP/1.0\r\n\r\n"
else
    #while bad_input
    ##    puts "Enter your name: "
     #   name = gets.chomp
    #    puts "Enter an email: "
    #    email = gets.chomp
    #    bad_input = false
    #end
    viking = Hash.new()
    viking[:viking] = Hash.new()
    viking[:viking][:name] = "Joe" #name
    viking[:viking][:email] = "joe@email.net" #email
    temp_request = JSON.dump(viking)
    request = "POST " + path +"&" + temp_request + " HTTP/1.0\r\n\r\n"
    puts request
    puts "The request was: "
    puts viking[:viking][:name]
end

socket = TCPSocket.open(host, port)
socket.print(request)
response = socket.read
puts response
while line = socket.gets
    puts line.chop
end

socket.close
