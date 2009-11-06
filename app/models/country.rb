class Country < ActiveRecord::Base
  has_many :users


  def self.for_select_box
    find(:all, :order => "sort_order asc, name asc").collect {|p| [ p.name[0..30], p.used_id ] }
  end

  def self.for_story_select_box
    [["todos los países", "all"]] | find(:all, :order => "sort_order asc, name asc").collect {|p| [ p.name[0..20], p.used_id ] }
  end

end


