module Boxnet
  class FileNode
    attr :files, :folders
    
    def process_node(data)
      # return data.nil?
      @files = []
      @folders = []      
      
      if data.has_key?("folder")
        puts "1" if data["folder"].nil?
        self.folders << Boxnet::Folder.new(data["folder"])
      elsif data.has_key?("folders")
        folder = data["folders"]["folder"]
        
        if folder.class == Array
          folder.each do |f|
            self.folders << Boxnet::Folder.new(f)
          end
        elsif folder.class == Hash
          self.folders << Boxnet::Folder.new(folder)
        end
      end
      
      if data.has_key?("files")
        file = data["files"]["file"]
        
        if file.class == Array
          file.each do |f|
            self.files << Boxnet::File.new(f)
          end
        elsif file.class == Hash
          self.files << Boxnet::File.new(file)
        end
      end
    end
    
  end
  
end