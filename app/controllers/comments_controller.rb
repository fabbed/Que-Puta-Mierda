class CommentsController < ApplicationController


  def create
    comment = Comment.new(params[:comment])
    
    @story = Story.find_by_id(params[:story])
    @story.add_comment(comment)

    flash[:notice] = "Comentario enviado."
    
    respond_to do |wants|
        wants.html { redirect_to story_path(@story) }
        wants.xml { render :xml => @comment, :status => :created, :location => @comment }
    end
  end
  
end
