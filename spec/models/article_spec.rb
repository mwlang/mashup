require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Article Model" do
  it 'can be created' do
    @article = Article.new
    @article.should_not be_nil
  end
end
