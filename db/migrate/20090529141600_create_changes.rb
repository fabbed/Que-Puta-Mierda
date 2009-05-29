class CreateChanges < ActiveRecord::Migration
  def self.up
    create_table :changes do |t|
      t.string :label       
      t.text :description
      t.date :change_date

      t.timestamps
    end
  end

  def self.down
    drop_table :changes
  end
end
