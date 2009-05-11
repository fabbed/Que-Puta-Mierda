class WelcomeController < ApplicationController

  def index
    @stories = Story.newest_first.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)
  end

end
