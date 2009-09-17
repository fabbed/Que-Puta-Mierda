class Admin::StoriesController < AdminController

  layout "admin"

  def index
    @stories = Story.for_administering.paginate(:page => params[:page], :per_page => 15)
  end


end
