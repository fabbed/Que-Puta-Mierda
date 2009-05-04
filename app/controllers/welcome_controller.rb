class WelcomeController < ApplicationController


  def index
    @stories = Story.moderated
  end


end
