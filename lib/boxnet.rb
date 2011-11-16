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
    get(@@URL + "?api_key=#{@@API_KEY}&action=get_ticket")
  end
  
  def self.get_auth_url_for_ticket(ticket)
    "https://www.box.net/api/1.0/auth/#{ticket}"
  end
  
  def self.get_auth_token(ticket)
    get(@@URL + "?api_key=#{@@API_KEY}&ticket=#{ticket}&action=get_auth_token")
  end
  
  def self.get_account_tree(auth_token, folder_id, options={})
    params = []
    params << "onelevel" if options[:onelevel]
    
    if params.empty?
      get(@@URL + "?api_key=#{@@API_KEY}&action=get_account_tree&auth_token=#{auth_token}&folder_id=#{folder_id}")
    else
      params_string = params.join(",")
      get(@@URL + "?api_key=#{@@API_KEY}&action=get_account_tree&auth_token=#{auth_token}&folder_id=#{folder_id}&params=#{params_string}")
    end
  end

end
