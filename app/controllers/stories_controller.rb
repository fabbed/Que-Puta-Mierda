class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.xml

  layout "application"

  protect_from_forgery :only => [:create, :update, :destroy] 
  before_filter :prepare_stuff, :only => [:vote_top, :vote_flop] 
  
  def tag
    @stories = Story.find_tagged_with(params[:id], :match_all => true).paginate(:page => params[:page], :per_page => STORIES_PER_PAGE)
    @tags = Story.tag_counts    
  end

  def prepare_stuff
    @story = Story.find(params[:id])    
    @stories = Story.newest_first
    @mode = params[:mode]
    flash[:success] = "Has votado por la historia #{@story.title}. <br/>Gracias por el voto!"
  end

  def vote_top
    session[:top_votes] << @story.id

    @story.rated_top = @story.rated_top + 1
    @story.save

    respond_to do |wants|
      wants.html do
        redirect_to root_path
      end
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
      wants.html do
        redirect_to root_path        
      end
      wants.js do
        render :partial => "mark_as_voted"
      end
    end
  end

  def tops
    @stories = Story.tops.paginate(:page => params[:page], :per_page => 8)
  end

  def flops
    @stories = Story.flops.paginate(:page => params[:page], :per_page => 8)
  end

  def index
    @stories = Story.newest_first.paginate(:page => params[:page], :per_page => 8)
  end

  # GET /stories/1
  # GET /stories/1.xml
  def show
    @story = Story.find(params[:id])

    @related_stories = Story.find_tagged_with(@story.tag_list, :limit => 10)
    @related_stories = @related_stories - [@story]
    
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

    @story.ip = request.env["REMOTE_ADDR"]
    
    location = GeoKit::Geocoders::GeoPluginGeocoder.geocode(@story.ip)
    @story.lat = location.lat if location.lat
    @story.lng = location.lng if location.lng
    @story.city = location.city if location.city
    @story.country_code = location.country_code if location.country_code
    
    

    respond_to do |format|
      if @story.save
        flash[:notice] = '¡Muy bien!<br/> Ahora tu historia se encuentra en la página de inicio donde también puedes votar otras historias.'
        format.html { redirect_to root_path(:param => "historia_creado") }
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

    @story.tag_list = params[:story][:tag_list]
    @story.administered = true
    respond_to do |format|
      if @story.update_attributes(params[:story])
        flash[:notice] = 'Story was successfully updated.'
        format.html { redirect_to admin_stories_path }
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

    flash[:notice] = 'Story deleted.'    

    respond_to do |format|
      format.html { redirect_to(admin_stories_path) }
      format.xml  { head :ok }
    end
  end
end
