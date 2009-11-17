class ResourcesController < ApplicationController

  def set_selected_country
    
    session[:selected_country] = params[:country_id]
    session[:selected_country] = nil if params[:country_id] == "all"
    
    session[:selected_country] =Country.find_by_iso(session[:geo_location].country_code.upcase).used_id.to_i if (session[:geo_location] && session[:country_selector] == "local")
    
    redirect_to params[:return_path]
  end

end
