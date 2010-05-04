Class.new(Sequel::Migration) do
  def up
    create_table(:articles, :ignore_index_errors=>true) do
      primary_key :id
      Integer :feed_id
      String :link, :size=>255
      String :title, :size=>255
      String :description, :size=>255
      DateTime :created_at
      DateTime :published_at
      String :guid, :size=>255
      Integer :status_id
      
      index [:feed_id]
      index [:link]
    end
    
    create_table(:feeds) do
      primary_key :id
      String :url, :size=>255
      String :link, :size=>255
      String :title, :size=>255
      String :description, :size=>255
      DateTime :last_updated
    end
    
    create_table(:schema_info) do
      Integer :version
    end
  end
  
  def down
    drop_table(:articles, :feeds, :schema_info)
  end
end
