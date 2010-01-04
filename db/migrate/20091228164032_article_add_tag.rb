class ArticleAddTag < ActiveRecord::Migration
  def self.up
    add_column :articles, :tag, :string
  end

  def self.down
    remove_column :articles, :tag
  end
end
