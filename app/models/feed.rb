class Feed < Sequel::Model
  one_to_many :articles
  
  one_to_many :new_articles, :class => :Article do |ds|
    ds.filter(:status_id => ArticleStatus[:new]).
      order(:published_at.desc)
  end
  
end
