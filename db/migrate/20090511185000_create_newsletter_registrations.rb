class CreateNewsletterRegistrations < ActiveRecord::Migration
  def self.up
    create_table :newsletter_registrations do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_registrations
  end
end
