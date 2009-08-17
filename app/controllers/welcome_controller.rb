class WelcomeController < ApplicationController

  before_filter :authenticate, :only => :authenticate
  

  def index
    @stories = Story.newest_first.paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)
    @tags = Story.tag_counts(:limit => 40)
  end


  def new
    @stories = Story.newest_first.paginate(:page => params[:page], :per_page => 10)
    render :action => "new_design", :layout => "new_layout"
  end




  private
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == "adolfo" && password == "test"
    end
  end



end
