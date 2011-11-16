require 'httparty'
require 'json'

class Boxnet
  include HTTParty
  @@API_KEY = nil
  @@URL = "https://www.box.net/api/1.0/rest"

  def self.API_KEY=(value)
    @@API_KEY = value
  end
  
  def self.get_ticket
    result = get(@@URL + "?api_key=#{@@API_KEY}&action=get_ticket")
  end

end
