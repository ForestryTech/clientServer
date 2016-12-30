require 'socket'

Class webServer
    def initialize()
        @server = TCPServer.open(2000)
            
    end

    def start()
        @client = @server.accept
        input = @client.gets
        
    end
end