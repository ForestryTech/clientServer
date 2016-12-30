require 'socket'
require 'json'

def parse_input(input)
    input_array = input.split(" ")
end
server = TCPServer.open(2000)

loop {
    client = server.accept
    
    input = client.gets

    input_array = parse_input(input)

    if input_array[0] === "GET"
        puts "This is a GET request"
        f = "./html" + input_array[1]
        puts "File name: #{f}"
        if File.exists?(f)
            lines = File.readlines f
            lines.each do |l|
                client.puts l
            end
        else
            client.puts "404 File not found."
        end
    elsif input_array[0] === "POST"
        puts "This is a POST request"
        resource = input_array[1].split('&')
        puts "POST info = #{resource[1]}"
        data = JSON.parse(resource[1])
        puts data
        puts "name = #{data['viking']['name']}"
        f_name = "html/thanks.html"
        lines = File.readlines f_name
        lines.each do |l|
            puts "*#{l}*"
            if l.include? "<%= yield %>"
                client.puts "<li>Name: #{data['viking']['name']}</li><li>Email: #{data['viking']['email']}</li>"
            else
                client.puts l
            end
        end
        puts "email = #{data['viking']['email']}"
    elsif input_array[0] === "HEAD"
        puts "This is a HEAD request"
    else
        puts "This request is unknown."
    end

    puts input
    client.puts(Time.now.ctime)
    client.puts "Closing the connections. Bye!"
    client.close
}


