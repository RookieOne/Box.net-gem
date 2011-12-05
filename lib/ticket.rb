module BoxnetApi
  class Ticket
    attr :ticket, :status
    
    def initialize(data)
      @ticket = data["response"]["ticket"]
      @status = data["response"]["status"]
    end
    
    def url
      "https://www.box.net/api/1.0/auth/#{@ticket}"
    end
    
  end
end