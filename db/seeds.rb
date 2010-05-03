# A sampling of RSS feeds to get started with

Feeds = ["http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml",
  "http://feeds.feedburner.com/RubyInside",
  "http://www.infoworld.com/homepage/feed",
  "http://www.infoworld.com/blogs/feed"]

Article.delete
Feed.delete

Feeds.each{|url| Feed.create(:url => url).refresh}

shell.say "================================================================="
shell.say "The Following feeds were added:"
shell.say "================================================================="
Feed.each{|f| shell.say "   #{f.title}\n"}
shell.say "================================================================="
shell.say ""