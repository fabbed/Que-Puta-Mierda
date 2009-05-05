class WelcomeController < ApplicationController

  def index
    @stories = Story.newest_first
  end

end
