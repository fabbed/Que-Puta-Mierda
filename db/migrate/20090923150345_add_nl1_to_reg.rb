class AddNl1ToReg < ActiveRecord::Migration
  def self.up
    add_column :newsletter_registrations, :nl1, :boolean, :default => false
    add_column :newsletter_registrations, :nl2, :boolean, :default => false
    add_column :newsletter_registrations, :nl3, :boolean, :default => false
    add_column :newsletter_registrations, :nl4, :boolean, :default => false
    add_column :newsletter_registrations, :nl5, :boolean, :default => false
    add_column :newsletter_registrations, :nl6, :boolean, :default => false
  end

  def self.down
    remove_column :newsletter_registrations, :nl1
    remove_column :newsletter_registrations, :nl2
    remove_column :newsletter_registrations, :nl3        
    remove_column :newsletter_registrations, :nl4
    remove_column :newsletter_registrations, :nl5
    remove_column :newsletter_registrations, :nl6            
  end
end
