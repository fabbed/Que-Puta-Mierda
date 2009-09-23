class AddCountryToSugerencia < ActiveRecord::Migration
  def self.up
    add_column :suggestions, :country_code, :string
  end

  def self.down
    remove_column :suggestions, :country_code
  end
end
