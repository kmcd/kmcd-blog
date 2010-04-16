APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))
require 'sinatra'
require 'redcloth'
require 'rake'
require 'active_support'
require 'lib/article'

class Blog < Sinatra::Application
  set :root, APP_ROOT
  before { cache_content }
  
  get '/' do
    @articles = Article.all
    erb :index
  end
  
  get /^\/(\w+.*)\.html$/ do |title|
    @article = Article.new title
    erb :show
  end
  
  helpers do
    def email_address
      '&#107;&#101;&#105;&#116;&#104;&#64;&#100;&#97;&#110;&#99;&#105;&#110;&#103;&#116;&#101;&#120;&#116;&#46;&#99;&#111;&#109;'
    end
  end
  
  private
  
  def cache_content(seconds=44640)
    response.headers['Cache-Control'] = "public, max-age=#{seconds}"
  end
end
