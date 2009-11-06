class AddMoreGeoInfoToVisitor < ActiveRecord::Migration
  def self.up
    add_column :visitors, :city, :string
    add_column :visitors, :lng, :float, :limit => 8
    add_column :visitors, :lat, :float, :limit => 8    
    add_column :visitors, :country_code, :string
    add_column :visitors, :user_agent, :string
  end

  def self.down
    remove_column :visitors, :lat
    remove_column :visitors, :lng
    remove_column :visitors, :country_code
    remove_column :visitors, :city
    remove_column :visitors, :user_agent
  end
end
