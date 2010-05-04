module Fetcher

  FIVE_MINUTES = 5 * 60 
  EXPIRATION_DATE = Date.today - 30

  class << self 
    def last_published(channel)
      channel.items.map{|m| m.date}.sort.last
    end

    def refresh(feed)
      response = open(feed[:url]){|rss| RSS::Parser.parse(rss.read)}
      return false if response.nil?

      if feed[:last_updated].nil? or last_published(response.channel) > feed[:last_updated]
        TDB[:feeds].filter(:id => feed[:id]).
        update :title => response.channel.title, 
        :link => response.channel.link,
        :last_updated => last_published(response.channel), 
        :description => response.channel.description

        response.channel.items.each do |article|
          if TDB[:articles].filter(:link => article.link).empty?
            TDB[:articles].insert(:feed_id => feed[:id], 
            :link => article.link,
            :title => article.title,
            :description => article.description,
            :created_at => Time.now,
            :published_at => article.date,
            :guid => article.guid.content,
            :status_id => 0)
          end
        end
      end
    end

    def delete_expired_articles
      expiration_date = 
      TDB[:articles].filter(:created_at < EXPIRATION_DATE).delete
    end

    def refresh_feeds
      TDB[:feeds].each{|feed| refresh(feed)}
    end
  end 

  Thread.new do 
    THREAD_DB_CONFIG = YAML.load(File.read(File.join(PADRINO_ROOT, 'config', 'database.yml')))
    TDB = Sequel.connect(THREAD_DB_CONFIG[Padrino.env.to_s])

    loop do
      begin
        delete_expired_articles
        refresh_feeds
      rescue => e
        logger.error e.inspect
      end
      sleep FIVE_MINUTES
    end
  end
end
