class ApplicationController < ActionController::Base
  before_filter :i_should_only_be_run_once, 
                :only => 'action_with_inherited_before_filter'
  
  after_filter  :record_pageview
  
  
  
  def record_pageview
    referring_search = Squeejee::SearchSniffer::ReferringSearch.new(request.env["HTTP_REFERER"])
    
    PageView.create!(:request_uri => request.env["REQUEST_URI"],
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
  


  def i_should_only_be_run_once
    true
  end
  private :i_should_only_be_run_once







end