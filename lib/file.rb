module BoxnetApi
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
end