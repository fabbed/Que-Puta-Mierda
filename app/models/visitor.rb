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








  def self.create_new(request, location)
    new_visitor = self.new
    new_visitor.vcode = self.generate_vcode
    new_visitor.referer = request.env["HTTP_REFERER"]
    new_visitor.ip = request.env["REMOTE_ADDR"]
    
    if location
      new_visitor.lat = location.lat if location.lat
      new_visitor.lng = location.lng if location.lng
      new_visitor.city = location.city if location.city
      new_visitor.country_code = location.country_code if location.country_code
      new_visitor.country_id = Country.find_by_iso(location.country_code.upcase).used_id if location.country_code
    end
    
    new_visitor.user_agent = request.env["HTTP_USER_AGENT"]
    new_visitor.save!
    new_visitor
  end


  def self.generate_vcode
    return rand(36**8).to_s(36)
  end


end
