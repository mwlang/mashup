Thread.new do
  FIVE_MINUTES = 5 * 60 
  EXPIRATION_DATE = Date.today - 30
  loop do
    if defined? DB
      DB[:articles].filter(:created_at < Date.today - EXPIRATION_DATE).delete
      Feed.refresh
    end
    sleep FIVE_MINUTES
  end
end
