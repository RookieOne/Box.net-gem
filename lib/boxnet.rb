require 'httparty'
require 'json'

module BoxnetApi
  class Client
    include HTTParty
    @@API_KEY = nil
    @@URL = "https://www.box.net/api/1.0/rest"

    def self.API_KEY=(value)
      @@API_KEY = value
    end
  
    def self.get_ticket
      data = get(@@URL + "?api_key=#{@@API_KEY}&action=get_ticket")
      Ticket.new(data)
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
      params << "nozip"
    
      if params.empty?
        raw_result = get(@@URL + "?api_key=#{@@API_KEY}&action=get_account_tree&auth_token=#{auth_token}&folder_id=#{folder_id}")
      else
        params_string = params.join(",")
        raw_result = get(@@URL + "?api_key=#{@@API_KEY}&action=get_account_tree&auth_token=#{auth_token}&folder_id=#{folder_id}&params[]=#{params_string}")
      end

      Result.new(raw_result)
    end
  end
  
  class FileNode
    attr :files, :folders
    
    def process_node(data)
      # return data.nil?
      @files = []
      @folders = []      

      if data.has_key?("folder")
        self.folders << BoxnetApi::Folder.new(data["folder"])
      elsif data.has_key?("folders")
        folder = data["folders"]["folder"]
        
        if folder.class == Array
          folder.each do |f|
            self.folders << BoxnetApi::Folder.new(f)
          end
        elsif folder.class == Hash
          self.folders << BoxnetApi::Folder.new(folder)
        end
      end
      
      if data.has_key?("files")
        file = data["files"]["file"]
        
        if file.class == Array
          file.each do |f|
            self.files << BoxnetApi::File.new(f)
          end
        elsif file.class == Hash
          self.files << BoxnetApi::File.new(file)
        end
      end
    end
    
  end
    
  class File < FileNode
    attr :id, :name, :description, :file_count, :sha1, :size
    attr :tags, :shared, :created, :updated, :user_id, :shared_link
    attr :thumbnail, :small_thumbnail, :large_thumbnail, :larger_thumbnail, :preview_thumbnail
    
    def initialize(data)
      @id = data["id"]
      @name = data["file_name"]
      @description = data["description"]
      @file_count = data["file_count"]
      @sha1 = data["sha1"]
      @size = data["size"]
      @tags = data["tags"]
      @shared = data["shared"]
      @created = data["created"]
      @updated = data["updated"]
      @user_id = data["user_id"]
      @shared_link = data["shared_link"]
      @thumbnail = data["thumbnail"]
      @small_thumbnail = data["small_thumbnail"]
      @large_thumbnail = data["large_thumbnail"]
      @larger_thumbnail = data["larger_thumbnail"]
      @preview_thumbnail = data["preview_thumbnail"]
      process_node(data)
    end
    
  end
  
  class Folder < FileNode
    attr :id, :name, :description, :file_count, :user_id
    attr :shared, :shared_link, :permission, :size, :created, :updated
    
    def initialize(data)
      @id = data["id"]
      @name = data["name"]
      @description = data["description"]
      @file_count = data["file_count"]
      @user_id = data["user_id"]
      @shared = data["shared"]
      @shared_link = data["shared_link"]
      @permission = data["permission"]
      @size = data["size"]
      @created = data["created"]
      @updated = data["updated"]
      process_node(data)
    end
    
  end
  

  
  class Result
    attr :raw_result, :file_tree
    
    def initialize(raw_result)
      @raw_result = raw_result
      unless status == "Wrong input" || status == "not_logged_in"
        @file_tree = BoxnetApi::FileTree.new(raw_result)
      end
    end
    
    def status
      @raw_result["response"]["status"]
    end
  end
  
  
  class FileTree < FileNode
  
    def initialize(raw_result)
      tree_data = raw_result["response"]["tree"]
      process_node(tree_data)
    end
    
  end
  
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
