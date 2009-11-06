# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  include AuthenticatedSystem


  # session :off #, :if => proc { |request| robot?(request.user_agent) }
    
  before_filter :create_ratings_session
  before_filter :create_visitor_or_load_existing
  before_filter :geocode_visitor
  
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

    def get_visitor_session
      if has_cookie? and has_session?
        visitor_session = VisitorSession.find_by_session_id(session[:visitor_session_id])
        if visitor_session.visitor_id == session[:visitor_id]
          return visitor_session
        end
      end
      return false
    end
    
    def create_visitor_or_load_existing
      puts "============================================================="
      puts "============create_visitor_or_load_existing=================="
      if !(robot?(request.user_agent)) and request.env["REQUEST_METHOD"] == "GET" #if no robot
        if !(has_cookie?) and params[:controller] == "stories" and params[:action] == "index" #kein cookie & STARTSEITE
          puts "==== -> New first visitor"
          new_visitor = Visitor.create_new(request)
          new_visitor.create_visitor_session(request)
          store_session_variables(new_visitor.id, new_visitor.visitor_sessions.last.session_id)
          cookies[:vcode] = { :value => new_visitor.vcode, :expires => Time.now.next_year}
        elsif (has_cookie? and !(has_session?)) #wenn er cookie hat aber keine session
          puts "==== -> Returning visitor"
          if (returning_visitor = Visitor.find_by_vcode(cookies[:vcode])) #visitor laden
            returning_visitor.logins = returning_visitor.logins + 1
            returning_visitor.create_visitor_session(request) #neue session
            returning_visitor.save
            store_session_variables(returning_visitor.id, returning_visitor.visitor_sessions.last.session_id)
          end
        elsif (has_cookie? and has_session?) 
          puts "==== -> Session continuation"
          if ((visitor_session = get_visitor_session))
            visitor_session.pageviews = visitor_session.pageviews + 1
            visitor_session.save
            puts "pageview + 1"
          end
        end
      end
      puts "============================================================="
    end

    def store_session_variables(visitor_id, last_session_id)
      session[:visitor_id] = visitor_id
      session[:visitor_session_id] = last_session_id
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
   
    
    # def valid_referer?
    #   puts "referer"
    #   puts request.env["HTTP_REFERER"].to_s
    #   return true
    # end
  
    def geocode_visitor
      session[:geo_location] ||= retrieve_location_from_cookie_or_service
      cookies[:geo_location] = { :value => session[:geo_location].to_yaml, :expires => 30.days.from_now } if session[:geo_location]
    end    
    
    # Uses the stored location value from the cookie if it exists.  If
    # no cookie exists, calls out to the web service to get the location. 
    def retrieve_location_from_cookie_or_service
      return YAML.load(cookies[:geo_location]) if cookies[:geo_location]
      location = GeoKit::Geocoders::GeoPluginGeocoder.geocode(request.env["REMOTE_ADDR"])
      return location.success ? location : nil
    end
    
    
    
    def robot?(user_agent)
      user_agent =~ /(Baidu|bot|Google|SiteUptime|Slurp|WordPress|ZIBB|ZyBorg|Spider|Sogou)/i
    end

end