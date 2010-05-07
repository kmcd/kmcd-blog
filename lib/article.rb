require 'rake'
require 'redcloth'

class Article
  def initialize(title)
    @file_name = title.match(/articles\/\w.*\.txtl/) ? title : 'articles/' + title + '.txtl'
    @article = File.open(@file_name).read
  end
  
  def self.all
    Dir["articles/*txtl"].map {|file| new file }
  end
  
  def content
    RedCloth.new(content_markup).to_html
  end
  
  def tag
    info['tag']
  end
  
  def title
    info['title']
  end
  
  def updated_at
    return Date.today unless info['date']
    Date.parse(info['date'].to_s)
  end
  
  def file_name
    @file_name.gsub!(/\/*articles\//,'').gsub!(/\.txtl$/, '.html')
  end
  
  private
  
  def info
    @info ||= YAML.load(@article)
  end
  
  def content_markup
    @article.gsub(/---.*---/m, '')
  end
end
