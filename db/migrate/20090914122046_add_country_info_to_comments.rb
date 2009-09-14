class AddCountryInfoToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :country_id, :integer
    add_column :comments, :city, :string
    add_column :comments, :country_name, :string
    add_column :comments, :country_code, :string
  end

  def self.down
  end
end
