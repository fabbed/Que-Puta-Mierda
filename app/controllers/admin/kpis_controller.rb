class Admin::KpisController < ApplicationController
  before_filter :login_required, :is_admin

  layout "admin"


  def index
    @data = Array.new
  
    first_user_date = User.date_of_first_registration
    
    ((Date.today - User.date_of_first_registration)+1).to_i.times do |i|
      n = (i)

      from = (first_user_date + n.days).beginning_of_day
      to = (first_user_date+(n+1).days).beginning_of_day

      user_count = User.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
      story_count = Story.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
      story_count_with_email = Story.count(:conditions => ["created_at BETWEEN ? AND ? AND email IS NOT NULL",from, to])      
      pvs_count = Pageview.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
      newsletter_count = NewsletterRegistration.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])      
      visitors_count = Pageview.count(:conditions => ["created_at BETWEEN ? AND ?",from, to], :group => "session").size      

      @data << {:date => i, :users => user_count, 
                :stories => story_count, 
                :stories_with_email => story_count_with_email,
                :pvs => pvs_count, 
                :visitors => visitors_count,
                :newsletter_count => newsletter_count}

    end  
    
    
        
  end


  def is_admin
    unless current_user.admin == true
      flash[:notice] = "No tienes los derechos"
      redirect_to root_path
    end
  end


end
