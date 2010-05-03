module RSS
  Feeds = ["http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml",
    "http://feeds.feedburner.com/RubyInside",
    "http://www.infoworld.com/homepage/feed",
    "http://www.infoworld.com/blogs/feed"]
  
    def render_rss(source)
      html = "<div class='panel'>\n"
      content = ''
      open(source) do |s| content = s.read end
      rss = RSS::Parser.parse(content, false)
      html << rss.to_html
      html << "\n</div>\n"
      html
    end

    def self.fetch(url)
      open(url){|rss| RSS::Parser.parse(rss.read)}
    end
  
  class Rss
    def to_html
      max_description_length = 100

      html = "<a class='title' href='#{channel.link}'>"
      if channel.image
        html << "<img src='#{channel.image.url}' alt='#{channel.title}' title='#{channel.title}'/></a>"
      else 
        html << channel.title << "</a>"
      end

      html << "<small>Updated on #{channel.date.strftime('%m/%d/%Y')}</small>" if channel.date
      html << "<p>#{channel.description}</p>" if channel.description
    
      channel.items.each do |i|
        html << "<p><a href='#{i.link}' title='Added on #{i.date.strftime("%m/%d/%Y")} at #{i.date.strftime("%I:%M%p")}'>#{i.title}</a>"
        desc_text = i.description.gsub(/<[^>]+>/,"").squeeze(" ").strip
        html << " - #{desc_text}"
        html << "</p>"
      end
      html
    end
  end

end

puts "Rss module loaded..."