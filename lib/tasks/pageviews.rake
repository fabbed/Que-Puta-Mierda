namespace :pageviews do

  # SELECT count(id), id, created_at
  # FROM pageviews
  # where created_at BETWEEN "2009-08-01 00:00:00.0" AND "2009-08-08 00:00:00.0" GROUP BY ip_address; 

  # SELECT count(id), session, created_at
  # FROM pageviews
  # where created_at BETWEEN "2009-08-01 00:00:00.0" AND "2009-08-08 00:00:00.0" GROUP BY session having count(id) > 1; 

    def get_page_views(from, to)
      return Pageview.no_bots.count(:conditions => ['created_at BETWEEN ? AND ?', from, to])
    end

    def get_sessions(from, to)
      return Pageview.count(:conditions => ['created_at BETWEEN ? AND ?', from, to], :group => "session").inject([]) { |pvs, pv| pvs << pv[1]}
    end


      base_path = "/Users/fabian/Desktop/seradestino.com/R/qpm_test_data/"


    def get_session_time_array(sessions)
      session_times = []

      sessions.each_with_index do |session_with_more_than_one, i|
        # puts session_with_more_than_one["session"] + ": " + session_with_more_than_one["count(session)"]
        pvs_of_session = Pageview.find(:all, :conditions => {:session => session_with_more_than_one["session"]} )
        first_pv = pvs_of_session[0]
        last_pv  = pvs_of_session[pvs_of_session.size-1]
        
        time_per_session = (last_pv.created_at - first_pv.created_at)
        time_per_page =  time_per_session / pvs_of_session.size

        time_per_session_with_last_page = time_per_session + time_per_page

        session_times << time_per_session_with_last_page.round

        puts "#{i}TpS: #{time_per_session}"
        puts "#{i}TpP: #{time_per_page}"
        puts
        
      end
      return session_times.reject { |e|  e > 1800}
    end

    task :avg_time_for_page => :environment do

      #BEFORE DESIGN
        sessions_with_more_than_one_pv = Pageview.find(:all, :select => "count(session), session", :group => "session", :having=>"count(session) > 1 and count(session) < 10", :conditions => ["created_at between ? and ?", "2009-08-01 00:00:00.0", "2009-08-08 00:00:00.0"] )

        session_times = get_session_time_array(sessions_with_more_than_one_pv)

        File.open(base_path+"session_times_before_design.txt", 'w') {|f| f.write("session_times\n" + session_times.join("\n")) }      


      #AFTER DESIGN
        sessions_with_more_than_one_pv = Pageview.find(:all, :select => "count(session), session", :group => "session", :having=>"count(session) > 1 and count(session) < 10", :conditions => ["created_at between ? and ?", "2009-09-19 00:00:00.0", "2009-09-27 00:00:00.0"] )

        session_times = get_session_time_array(sessions_with_more_than_one_pv)

        File.open(base_path+"session_times_after_design.txt", 'w') {|f| f.write("session_times\n" + session_times.join("\n")) }      
    end
    
    
    def get_random_data
      data_array = []
      30.times do
        rand_1 = rand(3)
        rand_2 = rand(3)
      
        if (rand_1 == rand_2)
          data_array << rand_1
        else
          data_array << 0
        end
      end
      return data_array
    end
    

    task :comments => :environment do
      
      data_array = []
      data_array = get_random_data
      File.open(base_path+"comments_before_design.txt", 'w') {|f| f.write("comments\n" + data_array.join("\n")) }            

      data_array = get_random_data
      File.open(base_path+"stories_before_design.txt", 'w') {|f| f.write("comments\n" + data_array.join("\n")) }            

      data_array = get_random_data
      File.open(base_path+"recommended_before_design.txt", 'w') {|f| f.write("comments\n" + data_array.join("\n")) }            


    end

    # task :stories => :environment do
    # end
    # 
    # task :recommended => :environment do
    # end

    

    desc "PageView Verteilung"
    task :generate_files_before_and_after_design => :environment do

      base_path = "/Users/fabian/Desktop/seradestino.com/R/qpm_test_data/"

      pvs_total = get_page_views("2009-08-27 00:00:00.0","2009-09-04 00:00:00.0")
      pvs_per_visitor = get_sessions("2009-08-27 00:00:00.0","2009-09-04 00:00:00.0")
      
      pvs_rejected = 0
      pvs_per_visitor.each do |session|
        if session > 40
          pvs_rejected = pvs_rejected + session
        end
      end
      pvs_per_visitor = pvs_per_visitor.reject { |e|  e > 40}

      File.open(base_path+"page_views_before_design.txt", 'w') {|f| f.write("PVsBeforeDesign\n" + pvs_per_visitor.join("\n")) }
      
      puts "======== BEFORE DESIGN ========"
      puts "# PVs rejected: " + pvs_rejected.to_s
      puts "# Pageviews: " + (pvs_total-pvs_rejected).to_s
      puts "# Visitors: " +  pvs_per_visitor.size.to_s
      puts
      puts

      pvs_total = get_page_views("2009-09-12 00:00:00.0","2009-09-20 00:00:00.0")
      pvs_per_visitor = get_sessions("2009-09-12 00:00:00.0","2009-09-20 00:00:00.0")

      pvs_rejected = 0
      pvs_per_visitor.each do |session|
        if session > 40
          pvs_rejected = pvs_rejected + session
        end
      end
      pvs_per_visitor = pvs_per_visitor.reject { |e|  e > 40}
      
      puts "======== AFTER DESIGN ========"      
      puts "# Pageviews: " + pvs_total.to_s
      puts "# Visitors: " + pvs_per_visitor.size.to_s

      File.open(base_path+"page_views_after_design.txt", 'w') {|f| f.write("PVsAfterDesign\n" + pvs_per_visitor.join("\n")) }
    end

    # desc "One week distributions"
    # task :pv_week_session => :environment do
    #   file_data = Pageview.count(:conditions => ['created_at BETWEEN "2009-08-01 00:00:00.0" AND "2009-08-08 00:00:00.0"'], :group => "session").inject([]) { |pvs, pv| pvs << pv[1] }
    #   new_file_data = file_data
    #   File.open("week_pageviews_session.txt", 'w') {|f| f.write("Pageviews\n" + new_file_data.join("\n")) }
    # end
    # 
    # desc "One week distributions"
    # task :pv_week_ip => :environment do
    #   file_data = Pageview.count(:conditions => ['created_at BETWEEN "2009-08-01 00:00:00.0" AND "2009-08-08 00:00:00.0"'], :group => "ip_address").inject([]) { |pvs, pv| pvs << pv[1] }
    #   new_file_data = file_data
    #   File.open("week_pageviews_ip.txt", 'w') {|f| f.write("Pageviews\n" + new_file_data.join("\n")) }
    # end

    task :files => [:avg_time_for_page, :generate_files_before_and_after_design, :comments, :stories, :recommended]

end
