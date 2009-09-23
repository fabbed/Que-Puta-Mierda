class Admin::SuggestionsController < AdminController

  layout "admin"

  def index
    
    @suggestions = Suggestion.all
    
  end


end
