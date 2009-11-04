class VisitorSession < ActiveRecord::Base

  belongs_to :visitor
  
  serialize   :stories
  serialize   :comments
  serialize   :ratings
  serialize   :recommendations
   
  
end
