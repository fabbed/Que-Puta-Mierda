# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  geocode_ip_address
  
  include AuthenticatedSystem


  session :off, :if => proc { |request| robot?(request.user_agent) }
    
  before_filter :create_ratings_session
  after_filter :track_pageview

  # after_filter  :record_pageview
  
  
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

  def create_ratings_session
    session[:top_votes] = Array.new if !session[:top_votes]
    session[:flop_votes] = Array.new if !session[:flop_votes]
  end


  private

    def track_pageview
      if has_cookie? and has_session?
        visitor_session = VisitorSession.find_by_session_id(session[:visitor_session_id])
        if visitor_session.visitor_id == session[:visitor_id]
          #session vom visitor
          visitor_session.pageviews = visitor_session.pageviews + 1
          visitor_session.save
          puts "track pageview"
        end
      else
        puts "error in trackpageview, has cookie but NO session"
      end
    end

    def create_visitor_or_load_existing
      if params[:controller] == "stories" and params[:action] == "index"
        if !(has_cookie?) #wenn er kein cookie hat -> NEUER VISITOR eingestiegen über STARTSEITE
          puts "no cookie"
          new_visitor = Visitor.create_new
          new_visitor.create_visitor_session(request)
          session[:visitor_id] = new_visitor.id
          session[:visitor_session_id] = new_visitor.visitor_sessions.last.session_id
          puts "-> create_visitor"
          puts "-> create_first_session"
          cookies[:vcode] = { :value => new_visitor.vcode, :expires => Time.now.next_year}
        else #wenn er cookie hat
          puts "has cookie"
          if !(session[:visitor_id]) #wenn er cookie hat aber keine session, dann ist er ein returning visitor
            puts "-> create_new_session"
            returning_visitor = Visitor.find_by_vcode(cookies[:vcode]) #visitor laden
            returning_visitor.logins = returning_visitor.logins + 1
            returning_visitor.create_visitor_session(request) #neue session
            returning_visitor.save
            session[:visitor_id] = returning_visitor.id
            session[:visitor_session_id] = returning_visitor.visitor_sessions.last.session_id
          end
        end
      end
    end

    def has_session?
      if session[:visitor_id]
        return true
      else
        return false
      end
      
    end

    def has_cookie?
      unless cookies[:vcode]
        return false
      else
        return true
      end
    end
    
    def robot?(user_agent)
      user_agent =~ /(Baidu|bot|Google|SiteUptime|Slurp|WordPress|ZIBB|ZyBorg)/i
    end




end
