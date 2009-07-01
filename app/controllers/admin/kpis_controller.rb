class Admin::KpisController < AdminController

  layout "admin"

  def index
    @change = Change.new
    
    
    
    @data = Array.new
  
    days= 2
  
    kpi_start_date = Date.today - days.days
    @kpi_start_date = kpi_start_date
    (days+1).times do |i|
      n = (i)

      from = (kpi_start_date + n.days).beginning_of_day
      to = (kpi_start_date+(n+1).days).beginning_of_day

      user_count = User.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
      story_count = Story.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
      story_count_with_email = Story.count(:conditions => ["created_at BETWEEN ? AND ? AND email IS NOT NULL",from, to])      
      pvs_count = Pageview.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
      visitors_xalut_count = Pageview.count(:conditions => ["created_at BETWEEN ? AND ? AND referer like '%xalut%'",from, to], :group => "session").size
      visitos_google_count = Pageview.count(:conditions => ["created_at BETWEEN ? AND ? AND referer like '%google%'",from, to], :group => "session").size 
      
      
      newsletter_count = NewsletterRegistration.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])      
      visitors_count = Pageview.count(:conditions => ["created_at BETWEEN ? AND ?",from, to], :group => "session").size      
      comments_count = Comment.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
      conversions = (story_count.to_f / visitors_count) * 100
      pvs_per_visitor = (pvs_count.to_f / visitors_count.to_f)

      @data << {:date => i, :users => user_count, 
                :stories => story_count, 
                :conversions => conversions,       
                :stories_with_email => story_count_with_email,
                :pvs => pvs_count, 
                :visitors_xalut_count => visitors_xalut_count,
                :visitos_google_count => visitos_google_count,
                :visitors => visitors_count,
                :comments => comments_count,
                :pvs_per_visitor => pvs_per_visitor,
                :newsletter_count => newsletter_count}

    end  
        
  end

end
