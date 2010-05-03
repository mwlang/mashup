require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Feed Model" do
  it 'can be created' do
    @feed = Feed.new
    @feed.should_not be_nil
  end
end
