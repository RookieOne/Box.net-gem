module Boxnet
  class FileNode
    attr :files, :folders
    
    def process_node(data)
      # return data.nil?
      @files = []
      @folders = []      
      
      if data.has_key?("folder")
        puts "1" if data["folder"].nil?
        self.folders << Folder.new(data["folder"])
      elsif data.has_key?("folders")
        folder = data["folders"]["folder"]
        
        if folder.class == Array
          folder.each do |f|
                    puts "2" if f.nil?
            self.folders << Folder.new(f)
          end
        elsif folder.class == Hash
                  puts "3" if folder.nil?
          self.folders << Folder.new(folder)
        end
      end
      
      if data.has_key?("files")
        file = data["files"]["file"]
        
        if file.class == Array
          file.each do |f|
                    puts "4" if f.nil?
            self.files << File.new(f)
          end
        elsif file.class == Hash
                  puts "5" if file.nil?
          self.files << File.new(file)
        end
      end
    end
    
  end
  
end