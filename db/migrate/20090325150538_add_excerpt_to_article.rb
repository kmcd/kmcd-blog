class AddExcerptToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :excerpt, :string
  end

  def self.down
    remove_column :articles, :excerpt
  end
end
