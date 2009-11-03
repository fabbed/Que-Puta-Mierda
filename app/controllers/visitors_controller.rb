class VisitorsController < ApplicationController

  before_filter :find_visitor

  VISITORS_PER_PAGE = 20

  def create
    @visitor = Visitor.new(params[:visitor])
    respond_to do |format|
      if @visitor.save
        flash[:notice] = 'Visitor was successfully created.'
        format.html { redirect_to @visitor }
        format.xml  { render :xml => @visitor, :status => :created, :location => @visitor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visitor.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @visitor.destroy
        flash[:notice] = 'Visitor was successfully destroyed.'        
        format.html { redirect_to visitors_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Visitor could not be destroyed.'
        format.html { redirect_to @visitor }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @visitors = Visitor.paginate(:page => params[:page], :per_page => VISITORS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @visitors }
    end
  end

  def edit
  end

  def new
    @visitor = Visitor.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @visitor }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @visitor }
    end
  end

  def update
    respond_to do |format|
      if @visitor.update_attributes(params[:visitor])
        flash[:notice] = 'Visitor was successfully updated.'
        format.html { redirect_to @visitor }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visitor.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_visitor
    @visitor = Visitor.find(params[:id]) if params[:id]
  end

end