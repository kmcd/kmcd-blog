class PublishCreatingARailsPlugin < ActiveRecord::Migration
  def self.up
    Article.create :title => "Creating a rails plugin", 
      :content => get_article, 
      :excerpt => "DRY up your code and help the community"
  end

  def self.down
    Article.find_by_title('Creating a rails plugin').destroy
  end
end

# TODO: add error handling for missing file
def get_article
  File.open(RAILS_ROOT + "/articles/creating_a_rails_plugin.txtl").read
end
