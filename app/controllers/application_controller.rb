# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  geocode_ip_address
  
  include AuthenticatedSystem
  
  before_filter :create_session
  after_filter  :record_pageview
  
  
  
  
  def is_admin
    unless current_user.admin == true
      flash[:notice] = "No tienes los derechos"
      redirect_to root_path
    end
  end
  
  
  def record_pageview
    referring_search = Squeejee::SearchSniffer::ReferringSearch.new(request.env["HTTP_REFERER"])
    
    Pageview.create!(:request_uri => request.env["REQUEST_URI"],
                    :request_method => request.env["REQUEST_METHOD"],
                    :referer => request.env["HTTP_REFERER"],
                    :session => request.session.session_id,
                    :ip_address => request.env["REMOTE_ADDR"],
                    :user_agent => request.env["HTTP_USER_AGENT"],
                    :http_accept => request.env["HTTP_ACCEPT"],
                    :http_accept_language => request.env["HTTP_ACCEPT_LANGUAGE"],
                    :http_accept_encoding => request.env["HTTP_ACCEPT_ENCODING"],
                    :search_engine => referring_search.engine,
                    :search_terms => referring_search.raw)
  end

  
  def create_session
    session[:top_votes] = Array.new if !session[:top_votes]
    session[:flop_votes] = Array.new if !session[:flop_votes]
  end

end
