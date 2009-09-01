class AddCountryIdToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :country_id, :integer
    add_column :stories, :city, :string
  end

  def self.down
    remove_column :stories, :city
    remove_column :stories, :country_id
  end
end
