class AddCountryNameToStories < ActiveRecord::Migration
  def self.up
    add_column :stories, :country_name, :string
  end

  def self.down
    remove_column :stories, :country_name
  end
end
