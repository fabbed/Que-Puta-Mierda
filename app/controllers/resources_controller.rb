class ResourcesController < ApplicationController

  def set_selected_country
    
    session[:selected_country] = params[:country_id]
    session[:selected_country] = nil if params[:country_id] == "all"
    
    redirect_to params[:return_path]
  end

end
