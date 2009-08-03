class AddIpAndStuffToStories < ActiveRecord::Migration
  def self.up
    
    add_column :stories, :ip, :string
    add_column :stories, :lng, :float, :limit => 8
    add_column :stories, :lat, :float, :limit => 8    
    add_column :stories, :country_code, :string
    
    
  end

  def self.down
    remove_column :stories, :lat
    remove_column :stories, :ip
    remove_column :stories, :lng
    remove_column :stories, :country_code
    
  end
end
