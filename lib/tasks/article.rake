namespace :article do
  desc "Re-generate all articles from textile source"
  task :update => :environment do
    Article.all.each do |article|
      article.update_attribute :content, content_for(article.title)
    end
  end
end

def content_for(title)
  article_name = title.downcase.gsub(/\W/,'_')
  File.open(RAILS_ROOT + "/articles/#{article_name}.txtl").read
end