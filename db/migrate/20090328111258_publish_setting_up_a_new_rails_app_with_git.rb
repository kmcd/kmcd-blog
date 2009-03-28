class PublishSettingUpANewRailsAppWithGit < ActiveRecord::Migration
  def self.up
    Article.create :title => "Setting up a new rails app with git", 
      :content => get_article, 
      :excerpt => "Get your rails app under source CONTROL ... stat!"
  end

  def self.down
    Article.find_by_title('Setting up a new rails app with git').destroy rescue nil
  end
end

# TODO: add error handling for missing file
def get_article
  File.open(RAILS_ROOT + "/articles/setting_up_a_new_rails_app_with_git.txtl").read
end
