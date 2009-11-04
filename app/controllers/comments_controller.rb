class CommentsController < ApplicationController


  def create
    comment = Comment.new(params[:comment])
    comment.user_id = current_user.id if current_user

    location = GeoKit::Geocoders::GeoPluginGeocoder.geocode(request.env["REMOTE_ADDR"])
    comment.country_code = location.country_code if location.country_code
    comment.city = location.city if location.city
    comment.country_name = Country.find_by_iso(comment.country_code.upcase).name if comment.country_code
    
    @story = Story.find(params[:story])
    @story.add_comment(comment)

    #Track: New Comment
    if (visitor_session = get_visitor_session)
      visitor_session.comments << comment.id
      visitor_session.save
      puts "Track: New Comments"
    else
      puts "error in track: new comment"        
    end
    

    if (@story.email.present? or @story.user_id.present?)
      UserMailer.deliver_new_comment(@story)
    end

    flash[:success] = "Comentario enviado."
    
    respond_to do |wants|
        wants.html { redirect_to story_path(@story, :param => "comentario_creado") }
        wants.xml { render :xml => @comment, :status => :created, :location => @comment }
    end
  end
  
end
