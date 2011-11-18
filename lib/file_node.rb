module Boxnet
  class FileNode
    attr :files, :folders
    
    def process_node(data)
      @files = []
      @folders = []
      
      if data["folder"]
        self.folders << Folder.new(data["folder"])
      elsif data["folders"]
        data["folders"]["folder"].each do |folder|
          self.folders << Folder.new(folder)
        end
      end
      
      if data["files"]
        data["files"]["file"].each do |file|
          self.files << File.new(file)
        end
      end
    end
    
  end
  
end