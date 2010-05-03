class Article < Sequel::Model
  def mark_as_read
    update(:status_id => 1)
  end
  
  def status
    ArticleStatus[status_id]
  end
end
