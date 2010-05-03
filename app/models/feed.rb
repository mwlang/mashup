class Feed < Sequel::Model
  one_to_many :articles
  
  one_to_many :new_articles, :class => :Article do |ds|
    ds.filter(:status_id => ArticleStatus[:new]).
      order(:published_at.desc)
  end
  
  def last_published(channel)
    channel.items.map{|m| m.date}.sort.last
  end
    
  def refresh
    feed = open(url){|rss| RSS::Parser.parse(rss.read)}
    return false if feed.nil?

    if last_updated.nil? or last_published(feed.channel) > last_updated
      update :title => feed.channel.title, 
        :link => feed.channel.link,
        :last_updated => last_published(feed.channel), 
        :description => feed.channel.description
        
      feed.channel.items.each do |article|
        if DB[:articles].filter(:link => article.link).empty?
          Article.create :feed_id => id, 
            :link => article.link,
            :title => article.title,
            :description => article.description,
            :created_at => Time.now,
            :published_at => article.date,
            :guid => article.guid,
            :status_id => ArticleStatus[:new]
        end
      end
    end
  end
end
