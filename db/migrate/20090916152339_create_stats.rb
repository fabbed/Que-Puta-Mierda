class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      
      t.date :day, :unique => true
      t.integer :pageviews
      t.integer :visitors
      t.integer :users
      t.integer :stories
      t.integer :stories_with_email      
      t.integer :comments
      t.integer :visitors_xalut_count      
      t.integer :visitos_google_count      
      
      t.integer :newsletter_registrations
      t.boolean :finished, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :stats
  end
end
