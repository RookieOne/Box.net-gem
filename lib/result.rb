module Boxnet
  class Result
    attr :raw_result, :file_tree
    
    def initialize(raw_result)
      @raw_result = raw_result
      @file_tree = Boxnet::FileTree.new(raw_result)
    end
    
    def status
      @raw_result["response"]["status"]
    end
  end
end