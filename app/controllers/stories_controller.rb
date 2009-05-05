class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.xml

  protect_from_forgery :only => [:create, :update, :destroy] 
  before_filter :prepare_stuff, :only => [:vote_top, :vote_flop] 
  
  layout "application"

  def prepare_stuff
    @story = Story.find_by_id(params[:id])    
    @stories = Story.moderated.newest_first
    @mode = params[:mode]
    flash[:notice] = "Gracias por el voto!"
  end

  def vote_top
    session[:top_votes] << params[:id].to_i
    flash[:notice] = "Gracias por el voto!"

    @story.rated_top = @story.rated_top + 1
    @story.save    
    
    respond_to do |wants|
      wants.html {  }
      wants.js do
        render :partial => "mark_as_voted"
      end
    end
  end

  def vote_flop
    session[:flop_votes] << params[:id].to_i
    @story.rated_flop = @story.rated_flop + 1
    @story.save
    
    respond_to do |wants|
      wants.html {  }
      wants.js do
        render :partial => "mark_as_voted"
      end
    end
  end

  def tops
    @stories = Story.moderated.tops
  end

  def flops
    @stories = Story.moderated.flops
  end

  def index
    @stories = Story.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.xml
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.xml
  def create
    @story = Story.new(params[:story])
    @story.tag_list = params[:story][:tag_list]
    @story.user = current_user if current_user
    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        format.html { redirect_to(@story) }
        format.xml  { render :xml => @story, :status => :created, :location => @story }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.xml
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to(@story) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.xml
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to(stories_url) }
      format.xml  { head :ok }
    end
  end
end
