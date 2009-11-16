class AddManipulationLevelToVisitor < ActiveRecord::Migration
  def self.up
    add_column :visitors, :manipulation_level, :string
  end

  def self.down
    remove_column :visitors, :manipulation_level
  end
end
