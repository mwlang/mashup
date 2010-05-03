class ArticleStatus
  class << self
    def [](value)
      {:new => 0, :read => 1, :ignored => 2, 0 => :new, 1 => :read, 2 => :ignored}[value] || 0
    end
  end
end
