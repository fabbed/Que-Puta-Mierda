class WelcomeController < ApplicationController

  def index
    @stories = Story.moderated.newest_first
  end

end
