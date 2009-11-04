class CreateVisitors < ActiveRecord::Migration
  def self.up
    create_table :visitors do |t|
      t.string :email
      t.string :vcode
      t.integer :logins, :default => 1
      t.string     :ip,           :limit => 15, :null => false
      t.string :referer
      t.belongs_to :country

      t.timestamps
    end
  end

  def self.down
    drop_table :visitors
  end
end
