APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require 'sinatra'
require 'active_support'
require 'lib/article'

class Blog < Sinatra::Application
  set :root, APP_ROOT
  before { cache_content }
  
  get '/' do
    @articles, @template = fetch_articles, :index
    erb @template
  end
  
  get '/keith_mcdonnell.rss' do
    # TODO: xml content type
    @articles, @template = fetch_articles, :rss_feed
    builder @template
  end
  
  get '/a/*' do
    @template = :landing_page
    erb @template
  end
  
  get /^\/(\w+.*)\.html$/ do |title|
    @article, @template = Article.new(title), :show
    erb @template
  end
  
  helpers do
    def title
      @article &&  @article.title || 'Keith McDonnell'
    end
    
    def email_address
      '&#107;&#101;&#105;&#116;&#104;&#64;&#100;&#97;&#110;&#99;&#105;&#110;&#103;&#116;&#101;&#120;&#116;&#46;&#99;&#111;&#109;'
    end
  end
  
  private
  
  def cache_content(seconds=44640)
    response.headers['Cache-Control'] = "public, max-age=#{seconds}"
  end
  
  def fetch_articles
    Article.all.sort_by {|a| a.updated_at }.reverse
  end
end
