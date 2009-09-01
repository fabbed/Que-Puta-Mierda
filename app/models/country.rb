class Country < ActiveRecord::Base
  has_many :users


  def self.for_select_box
    find(:all, :order => "sort_order asc, name asc").collect {|p| [ p.name[0..30], p.used_id ] }
  end
end


