Mashup.controllers :main do
  post :mark_as_read, :map => '/mark_as_read' do
    if article = Article[params[:article_id]]
      article.mark_as_read
    end
    return ""
  end
  
  get :index, :map => "(/)" do
    @feeds = Feed.all
    render "main/index"
  end
end
