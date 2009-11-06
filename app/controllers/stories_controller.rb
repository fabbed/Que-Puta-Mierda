class StoriesController < ResourcesController
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
    flash[:success] = "Has votado por la historia <a href='/stories/#{@story.id}'>#{@story.title}</a>. <br/>Gracias por el voto!"
  end

  def vote_top
    session[:top_votes] << @story.id

    @story.rated_top = @story.rated_top + 1
    @story.save

    new_rating

    respond_to do |wants|
      wants.html do
        redirect_to root_path
      end
      wants.js do
        render :partial => "mark_as_voted"
      end
    end
  end

  def new_rating
    #Track: New Comment
    if (visitor_session = get_visitor_session)
      visitor_session.ratings << @story.id
      visitor_session.save
      puts "Track: New Rating"
    else
      puts "error in track: new rating"        
    end
  end

  def vote_flop
    session[:flop_votes] << params[:id].to_i
    @story.rated_flop = @story.rated_flop + 1
    @story.save

    new_rating
    
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
    
    date_range=case params[:tiempo]
      when nil
        (Date.today-7.days)..(Date.today)
      when "hoy"
        (Date.today-1.days)..Date.today
      when "ayer"
        (Date.today-2.days)..(Date.today-1.day)
      when "semana"
        (Date.today-7.days)..(Date.today)
      when "mes"
        (Date.today-30.days)..(Date.today)
      when "siempre"
        "no sort"
    end
    
    unless date_range != "no sort"
      @stories = Story.tops.paginate(:page => params[:page], :per_page => 8)      
    else
      @stories = Story.tops.date_between(date_range).paginate(:page => params[:page], :per_page => 8)            
    end

  end

  def flops
    date_range=case params[:tiempo]
      when nil
        (Date.today-7.days)..(Date.today)
      when "hoy"
        (Date.today-1.days)..Date.today
      when "ayer"
        (Date.today-2.days)..(Date.today-1.day)
      when "semana"
        (Date.today-7.days)..(Date.today)
      when "mes"
        (Date.today-30.days)..(Date.today)
      when "siempre"
        "no sort"
    end
    
    unless date_range != "no sort"
      @stories = Story.flops.paginate(:page => params[:page], :per_page => 8)      
    else
      @stories = Story.flops.date_between(date_range).paginate(:page => params[:page], :per_page => 8)            
    end
  end

  def index
    builder = Story.scope_builder
    builder.newest_first
    builder.from_country(session[:selected_country]) if session[:selected_country]
    @stories = builder.paginate(:page => params[:page], :per_page => 8)
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

    location = session[:geo_location]
    @story.ip = request.env["REMOTE_ADDR"]

    if location
      @story.lat = location.lat if location.lat
      @story.lng = location.lng if location.lng
      @story.city = location.city if location.city
      @story.country_code = location.country_code if location.country_code
      @story.country_id = Country.find_by_iso(location.country_code.upcase).used_id if location.country_code
    end


    respond_to do |format|
      if @story.save
        flash[:success] = '¡Muy bien!<br/> Ahora tu historia se encuentra en la página de inicio donde también puedes votar otras historias.'

      #Track: New Story
      if (visitor_session = get_visitor_session)
        visitor_session.stories << @story.id
        visitor_session.save
        puts "pageview + 1"
      else
        puts "error in trackpageview, has cookie but NO visitor_session"        
      end


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
