module Boxnet
  class Result
    attr :raw_result, :file_tree
    
    def initialize(raw_result)
      @raw_result = raw_result
      unless status == "Wrong input"
        @file_tree = Boxnet::FileTree.new(raw_result)
      end
    end
    
    def status
      @raw_result["response"]["status"]
    end
  end
end