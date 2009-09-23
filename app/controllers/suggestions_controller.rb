class SuggestionsController < ApplicationController

  # render new.rhtml
  def index
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])

    location = GeoKit::Geocoders::GeoPluginGeocoder.geocode(request.env["REMOTE_ADDR"])
    @suggestion.country_code = location.country_code if location.country_code

    if @suggestion.save
      flash[:success] = "¡Gracias por tu sugerencia!"
      redirect_to root_path(:param => "sugerencia_creado")
    else
      render :action => 'index'
    end

  end
end
