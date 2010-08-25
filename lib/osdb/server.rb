module OSDb
  class Server
    
    def initialize(*args)
      @client = ::XMLRPC::Client.new(*args)
    end
    
    def info
      @client.call('ServerInfo')
    end
    
  end
end