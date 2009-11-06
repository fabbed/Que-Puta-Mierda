class ResourcesController < ApplicationController

  def set_selected_country
    session[:selected_country] = params[:country_id]
    redirect_to params[:return_path]
  end

end
