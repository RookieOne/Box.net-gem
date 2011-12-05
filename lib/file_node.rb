module BoxnetApi
  class FileNode
    attr :files, :folders
    
    def process_node(data)
      # return data.nil?
      @files = []
      @folders = []      
      
      if data.has_key?("folder")
        puts "1" if data["folder"].nil?
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
  
end