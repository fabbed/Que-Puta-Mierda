class Category < ActiveRecord::Base
  
  has_many :stories

  has_friendly_id :name


  def self.for_select_box
    find(:all, :order => "id asc").collect {|p| [ p.name[0..30], p.id ] }
  end


end
