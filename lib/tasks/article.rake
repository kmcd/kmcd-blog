ERROR_MSG = "You must specify an article title. Usage: $ rake article:new title='Ariticle title'"

namespace :article do
  desc "Re-generate all articles from textile source"
  task :update => :environment do
    Article.destroy_all
    Dir["#{RAILS_ROOT}/articles/*.*"].each do |article|
    Article.create! :content => File.open(article).read, :title => title_for(article)
    end
  end
  
  desc "Create a new blank article"
  task :new => :environment do
    puts(ERROR_MSG) && return if ENV['title'].blank?
    
    title, article_file = ENV['title'], markdown_file(title)
    `touch #{article_file} && echo "h1. #{ENV['title']}" > #{article_file}` 
    Article.create :title => title, :content => content_for(title), :excerpt => ENV['excerpt']
  end
end

def title_for(article)
  article.gsub(/(.*articles\/|\.\w+$)/, '').humanize
end

def content_for(title)
  File.open(markdown_file(title)).read
end

def markdown_file(title)
  RAILS_ROOT + "/articles/#{escaped_name(title)}.txtl"
end

def escaped_name(title)
  title.downcase.gsub(/\W/,'_')
end