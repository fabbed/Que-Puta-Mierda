class VisitorSessionsController < ApplicationController

  before_filter :find_visitor_session

  VISITOR_SESSIONS_PER_PAGE = 20

  def create
    @visitor_session = VisitorSession.new(params[:visitor_session])
    respond_to do |format|
      if @visitor_session.save
        flash[:notice] = 'VisitorSession was successfully created.'
        format.html { redirect_to @visitor_session }
        format.xml  { render :xml => @visitor_session, :status => :created, :location => @visitor_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visitor_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @visitor_session.destroy
        flash[:notice] = 'VisitorSession was successfully destroyed.'        
        format.html { redirect_to visitor_sessions_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'VisitorSession could not be destroyed.'
        format.html { redirect_to @visitor_session }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @visitor_sessions = VisitorSession.paginate(:page => params[:page], :per_page => VISITOR_SESSIONS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @visitor_sessions }
    end
  end

  def edit
  end

  def new
    @visitor_session = VisitorSession.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @visitor_session }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @visitor_session }
    end
  end

  def update
    respond_to do |format|
      if @visitor_session.update_attributes(params[:visitor_session])
        flash[:notice] = 'VisitorSession was successfully updated.'
        format.html { redirect_to @visitor_session }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visitor_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_visitor_session
    @visitor_session = VisitorSession.find(params[:id]) if params[:id]
  end

end