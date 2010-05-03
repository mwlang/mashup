class CreateFeeds < Sequel::Migration
  def up
    create_table :feeds do
      primary_key :id
      String :url
      String :link
      String :title
      String :description
      DateTime :last_updated
    end
  end

  def down
    drop_table :feeds
  end
end
