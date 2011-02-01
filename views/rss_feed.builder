xml.rss("version" => "0.91") {
  xml.channel {
    xml.title "Keith McDonnell's articles on software"
    xml.link  'http://www.keithmcdonnell.net'
    
    @articles.reverse.each do |article|
      xml.item {
        xml.title article.title
        xml.link  article.link
        xml.description  article.content
      }
    end
  }
}
