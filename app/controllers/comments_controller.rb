class CommentsController < ApplicationController


  def create
    comment = Comment.new(params[:comment])
    comment.user_id = current_user.id if current_user
    
    @story = Story.find_by_id(params[:story])
    @story.add_comment(comment)

    if @story.email or @story.user_id
      UserMailer.deliver_new_comment(@story)
    else

    flash[:notice] = "Comentario enviado."
    
    respond_to do |wants|
        wants.html { redirect_to story_path(@story) }
        wants.xml { render :xml => @comment, :status => :created, :location => @comment }
    end
  end
  
end
