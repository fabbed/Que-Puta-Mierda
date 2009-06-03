class Admin::StoriesController < AdminController

  layout "admin"

  def index
    @stories = Story.for_administering
  end


end
