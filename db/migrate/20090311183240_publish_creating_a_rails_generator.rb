class PublishCreatingARailsGenerator < ActiveRecord::Migration
  def self.up
    Article.create :title => "Creating a rails generator", 
      :content => get_article
  end

  def self.down
    begin
      Article.find_by_title('Creating a rails generator').destroy
    rescue nil
      puts "Couldn't find article"
    end
  end
end

# TODO: add error handling for missing file
def get_article
  File.open(RAILS_ROOT + "/articles/creating_a_rails_generator.txtl").read
end
