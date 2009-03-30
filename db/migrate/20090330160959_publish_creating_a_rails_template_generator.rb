class PublishCreatingARailsTemplateGenerator < ActiveRecord::Migration
  def self.up
    Article.create :title => "Creating a rails template generator", 
      :content => get_article, 
      :excerpt => "Speed up your Rails workflow with custom genterators"
  end

  def self.down
    Article.find_by_title('Creating a rails template generator').destroy rescue nil
  end
end

# TODO: add error handling for missing file
def get_article
  File.open(RAILS_ROOT + "/articles/creating_a_rails_template_generator.txtl").read
end
