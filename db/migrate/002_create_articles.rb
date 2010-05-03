class CreateArticles < Sequel::Migration
  def up
    create_table :articles do
      primary_key :id
      Integer :feed_id, :index => true
      String :link, :index => true
      String :title
      String :description
      DateTime :created_at
      DateTime :published_at
      String :guid
      Integer :status_id
    end
  end

  def down
    drop_table :articles
  end
end
