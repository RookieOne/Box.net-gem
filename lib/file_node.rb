module Boxnet
  class FileNode
    attr :files, :folders
    
    def process_node(data)
      @files = []
      @folders = []
            
      if data["folder"]
        self.folders << Folder.new(data["folder"])
      elsif data["folders"]
        folder = data["folders"]["folder"]
        if folder.class == Array
          folder.each do |f|
            self.folders << Folder.new(f)
          end
        elsif folder.class == Hash
          self.folders << Folder.new(folder)
        end
      end
      
      if data["files"]
        file = data["files"]["file"]
        if file.class == Array
          file.each do |f|
            self.files << File.new(f)
          end
        elsif file.class == Hash
          self.files << File.new(file)
        end
      end
    end
    
  end
  
end