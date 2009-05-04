class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    
    ["Trabajo",  "Dinero", "Salud", "Niños", "Amor", "Sexo", "Otros"].each do |category|
      Category.create!(:name => category)
    end

  end


  def self.down
    drop_table :categories
  end
end
