class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.text :body
      t.string :email
      t.boolean :on_startpage, :default => false
      
      t.belongs_to :category
      t.belongs_to :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
