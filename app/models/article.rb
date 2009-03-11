class Article < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title
  
  def to_param
    title.downcase.gsub(/\s/,'_')
  end
  
  def to_html
    RedCloth.new(content).to_html
  end
end
