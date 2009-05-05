# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
  
  before_filter :create_session

  
  def create_session
    session[:top_votes] = Array.new if !session[:top_votes]
    session[:flop_votes] = Array.new if !session[:flop_votes]
  end

end
