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
    if ENV['title'].blank?
      puts(ERROR_MSG) 
    else
      title = ENV['title']
      article_file = markdown_file(title)
      `touch #{article_file} && echo "# #{ENV['title']}" > #{article_file}`
      Article.create :title => title.humanize, :content => content_for(title), :excerpt => ENV['excerpt']
    end
  end
  
  desc "Catagorise all articles for home page table of contents"
  task :tag => :environment do
    tag_with 'Miscellaneous', /\w+/
    tag_with 'Business', /(customer|kawazaki)/i
    tag_with 'Project Management', /(scrum|kanban)/i
    tag_with 'Rails', /rails/i
    tag_with 'Ruby', /ruby/i
    tag_with 'Algorithms', /euclid/i
  end
end

def tag_with(category, keyword_regex)
  Article.all.each {|a| a.update_attribute(:tag, category) if a.title =~ keyword_regex }
end

def title_for(article)
  article.gsub(/(.*articles\/|\.\w+$)/, '').humanize
end

def content_for(title)
  File.open(markdown_file(title)).read
end

def markdown_file(title)
  "#{RAILS_ROOT}/articles/#{escaped_name(title)}.txtl"
end

def escaped_name(title)
  title.downcase.gsub(/\W/,'_')
end