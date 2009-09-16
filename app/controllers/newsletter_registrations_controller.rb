class NewsletterRegistrationsController < ApplicationController
  # GET /newsletter_registrations
  # GET /newsletter_registrations.xml
  def index
    @newsletter_registrations = NewsletterRegistrations.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletter_registrations }
    end
  end

  # GET /newsletter_registrations/1
  # GET /newsletter_registrations/1.xml
  def show
    @newsletter_registrations = NewsletterRegistrations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletter_registrations }
    end
  end

  # GET /newsletter_registrations/new
  # GET /newsletter_registrations/new.xml
  def new
    @newsletter_registrations = NewsletterRegistrations.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletter_registrations }
    end
  end

  # GET /newsletter_registrations/1/edit
  def edit
    @newsletter_registrations = NewsletterRegistrations.find(params[:id])
  end

  # POST /newsletter_registrations
  # POST /newsletter_registrations.xml
  def create
    @newsletter_registrations = NewsletterRegistration.new(params[:newsletter_registration])

    respond_to do |format|
      if @newsletter_registrations.save
        flash[:success] = 'Te has registrado para el newsletter.'
        format.html { redirect_to(root_path, :param => "nueva_registracion_de_newsletter") }
        format.xml  { render :xml => @newsletter_registrations, :status => :created, :location => @newsletter_registrations }
      else
        format.html { redirect_to(root_path) }
        format.xml  { render :xml => @newsletter_registrations.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsletter_registrations/1
  # PUT /newsletter_registrations/1.xml
  def update
    @newsletter_registrations = NewsletterRegistrations.find(params[:id])

    respond_to do |format|
      if @newsletter_registrations.update_attributes(params[:newsletter_registrations])
        flash[:notice] = 'NewsletterRegistrations was successfully updated.'
        format.html { redirect_to(@newsletter_registrations) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletter_registrations.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_registrations/1
  # DELETE /newsletter_registrations/1.xml
  def destroy
    @newsletter_registrations = NewsletterRegistrations.find(params[:id])
    @newsletter_registrations.destroy

    respond_to do |format|
      format.html { redirect_to(newsletter_registrations_url) }
      format.xml  { head :ok }
    end
  end
end
