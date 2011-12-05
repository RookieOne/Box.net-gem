module BoxnetApi
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
end