module Boxnet
  class FileTree < FileNode
  
    def initialize(raw_result)
      tree_data = raw_result["response"]["tree"]
      process_node(tree_data)
    end
    
  end
end