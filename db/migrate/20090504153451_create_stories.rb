class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.text :body
      t.string :email
      t.integer :rated_top, :default => 0
      t.integer :rated_flop, :default => 0

      t.boolean :anonymous, :default => false      

      t.boolean :on_startpage, :default => false
      t.integer :rated_top, :default => 0
      t.integer :rated_flop, :default => 0
      
      t.belongs_to :category
      t.belongs_to :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
