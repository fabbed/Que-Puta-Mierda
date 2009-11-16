class CreateLocation < ActiveRecord::Migration
  def self.up

    create_table :locations do |t|
      t.string    :ip,           :limit => 15, :null => false
      t.float     :lng, :limit => 8
      t.float     :lat, :limit => 8      
      t.integer   :country_id
      t.string :locatable_type
      t.belongs_to :locatable
    end
  end

  def self.down
    drop_table :locations    
  end
end
