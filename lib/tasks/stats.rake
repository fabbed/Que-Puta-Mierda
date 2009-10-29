namespace :stats do

    desc "Calculates statistics"
    task :create => :environment do
      
      days= 60
      kpi_start_date = Date.today - days.days
      @kpi_start_date = kpi_start_date
      
      (days+1).times do |i|

        data = Hash.new
        from = (kpi_start_date + i.days).beginning_of_day
        to = (kpi_start_date+(i+1).days).beginning_of_day
        
        puts "#{from} - #{to}"
        puts from.to_date
        
        unless (Stats.find_by_day(from.to_date) and Stats.find_by_day(from.to_date).pageviews > 2000)
          puts "Not there"          
          # if from.to_date == "2009-09-09".to_date
          #   Stats.create!(:day => from.to_date)
          # end
          
          data =   {:day => from.to_date,
                    :pageviews => Pageview.count(:conditions => ["created_at BETWEEN ? AND ?",from, to]), 
                    :visitors => Pageview.count(:conditions => ["created_at BETWEEN ? AND ?",from, to], :group => "session").size,       
                    :users => User.count(:conditions => ["created_at BETWEEN ? AND ?",from, to]),
                    :stories => Story.count(:conditions => ["created_at BETWEEN ? AND ?",from, to]),
                    :stories_with_email => Story.count(:conditions => ["created_at BETWEEN ? AND ? AND email IS NOT NULL",from, to]),
                    :comments => Comment.count(:conditions => ["created_at BETWEEN ? AND ?",from, to]),
                    :visitors_xalut_count => Pageview.count(:conditions => ["created_at BETWEEN ? AND ? AND referer like '%xalut%'",from, to], :group => "session").size,
                    :visitos_google_count => Pageview.count(:conditions => ["created_at BETWEEN ? AND ? AND referer like '%google%'",from, to], :group => "session").size ,
                    :newsletter_registrations => NewsletterRegistration.count(:conditions => ["created_at BETWEEN ? AND ?",from, to])
                    }
          
          statttt = Stats.new(data)
          statttt.finished = true
          statttt.save!
          
        else
          puts "Already there"
        end
        
        puts
        puts

      end
    end


    desc "PageView Verteilung"
    task :pv_distributions => :environment do
    
      file_data = Pageview.count(:conditions => [""], :group => "ip_address").inject([]) { |pvs, pv| pvs << pv[1] }
    
      new_file_data = file_data.reject { |e| e > 10}
    
      File.open("page_view_distributions.txt", 'w') {|f| f.write("Pageviews\n" + new_file_data.join("\n")) }

    
    end



end
