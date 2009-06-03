class AddStroriesAdministered < ActiveRecord::Migration
  def self.up
    add_column :stories, :administered, :boolean, :default => false
  end

  def self.down
    remove_column :stories, :administered
  end
end
