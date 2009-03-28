class AddTimestampsToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :updated_on, :timestamp
  end

  def self.down
    remove_column :articles, :updated_on
  end
end
