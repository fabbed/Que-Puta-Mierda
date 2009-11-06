class Country < ActiveRecord::Base
  has_many :users


  def self.for_select_box
    find(:all, :order => "sort_order asc, name asc").collect {|p| [ p.name[0..30], p.used_id ] }
  end

  def self.for_story_select_box
    [["TODOS LOS PAÍSES", "all"]] | [['Alemania', 3], ['Argentina', 12], ['Bolivia', 29], ['Brasil', 32], ['Chile', 42], ['Colombia', 46], ['Costa Rica', 52], ['Ecuador', 57], ['El Salvador', 59], ['España', 64], ['Estados Unidos', 65], ['Guatemala', 82], ['Honduras', 89], ['México', 148], ['Nicaragua', 159], ['Noruega', 163], ['Panamá', 171], ['Paraguay', 173], ['Perú', 174], ['Puerto Rico', 178], ['República Dominicana', 184], ['Uruguay', 231], ['Venezuela', 234]]
  end

end


