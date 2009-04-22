namespace :article do
  desc "Re-generate all articles from textile source"
  task :update => :environment do
    Article.all.each do |article|
      article.update_attribute :content, content_for(article.title)
    end
  end
  
  desc "Create a new blank article"
  task :new => :environment do
    if ENV['title'].blank?
      puts error_message
    else
      title         = ENV['title']
      article_file  = markdown_file(title)
      `touch #{article_file} && echo "h1. #{ENV['title']}" > #{article_file}` 
      Article.create :title => title, :content => content_for(title), 
        :excerpt => ENV['excerpt']
    end
  end
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

def error_message
  "You must specify an article title. Usage: $ rake artcile:new title='Ariticle title'"
end