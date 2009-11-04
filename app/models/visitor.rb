class Visitor < ActiveRecord::Base
  
  has_many :visitor_sessions

  def create_visitor_session(request)
    self.visitor_sessions << VisitorSession.create(
                                            :session_id => request.session.session_id, 
                                            :ip => request.env["REMOTE_ADDR"],
                                            :request_method => request.env["REQUEST_METHOD"],
                                            :referer => request.env["HTTP_REFERER"],
                                            :http_accept_language => request.env["HTTP_ACCEPT_LANGUAGE"],
                                            :user_agent => request.env["HTTP_USER_AGENT"],
                                            :comments => Array.new,                                            
                                            :stories => Array.new,                                            
                                            :recommendations => Array.new,                                            
                                            :ratings => Array.new
                                            )
  end








  def self.create_new(request)
    new_visitor = self.create(:vcode => self.generate_vcode, :ip =>request.env["REMOTE_ADDR"], :referer => request.env["HTTP_REFERER"])
  end


  def self.generate_vcode
    return rand(36**8).to_s(36)
  end


end
