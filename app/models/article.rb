class Article < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title
  
  def to_param
    title.downcase.gsub(/\s/,'_')
  end
  
  def to_html
    # TODO: cache content in column & update on edit
    RedCloth.new(
      RAILS_ENV == 'development' ? content_for(title) : content
    ).to_html
  end
  
  # TODO: dry up with lib/tasks/article.rake
  def content_for(title)
    File.open(markdown_file(title)).read
  end
  
  def markdown_file(title)
    RAILS_ROOT + "/articles/#{escaped_name(title)}.txtl"
  end
  
  def escaped_name(title)
    title.downcase.gsub(/\W/,'_')
  end
end
