  # Mit Selector: 2009-11-09 00:00:00 (-) 2009-11-10 00:00:00
  # Ohne:       : 2009-11-05 13:00:00 (-) 2009-11-06 13:00:00
  # 
  # Tabelle
  #   pageviews
  #   Nationality(mexican, spanish)
  #   country_selector(y,n) (im realen Beispiel: neutral, mx_adapted, es_adapted)


BASE_PATH = "/Users/fabian/Desktop/Master/R/"

namespace :r_file_for do

    desc "PageView Verteilung"
    task :pageviews => :environment do
      header_line = ["pageviews", "id", "nationality", "country_selector", "time", "start", "end"]

      no_selector = {:from => "2009-11-04 15:00:00", :to => "2009-11-06 15:00:00"}
      yes_selector ={:from => "2009-11-09 16:00:00", :to => "2009-11-11 13:00:00"}

      data_lines_no = []
      data_lines_yes = []      
      
      file_data=""
              
      [no_selector, yes_selector].each_with_index do |time_range, range_index|

        visitors = Visitor.find(:all, :conditions => ['created_at BETWEEN ? AND ?', time_range[:from], time_range[:to]])

        if range_index == 0
          puts "Index: 0"
          puts "Visitors total: #{visitors.size}"
          visitors.each_with_index do |visitor,i|
            data_lines_no[i]=[]
            data_lines_no[i][0]=visitor.visitor_sessions.first.pageviews
            data_lines_no[i][1]=visitor.id            
            data_lines_no[i][2]=visitor.country.name if visitor.country
            data_lines_no[i][3]="no"
            data_lines_no[i][4]=(visitor.visitor_sessions.first.pageviews==1) ? 60: (visitor.visitor_sessions.first.updated_at-visitor.visitor_sessions.first.created_at)
            data_lines_no[i][5]=visitor.visitor_sessions.first.created_at
            data_lines_no[i][6]=visitor.visitor_sessions.first.updated_at
          end
        elsif range_index == 1
          puts "Index: 1"
          puts "Visitors total: #{visitors.size}"          
          visitors.each_with_index do |visitor,i|
            data_lines_yes[i]=[]
            data_lines_yes[i][0]=visitor.visitor_sessions.first.pageviews
            data_lines_yes[i][1]=visitor.id
            data_lines_yes[i][2]=visitor.country.name if visitor.country
            data_lines_yes[i][3]="yes"
            data_lines_yes[i][4]=(visitor.visitor_sessions.first.pageviews==1) ? 60: (visitor.visitor_sessions.first.updated_at-visitor.visitor_sessions.first.created_at)
            data_lines_yes[i][5]=visitor.visitor_sessions.first.created_at
            data_lines_yes[i][6]=visitor.visitor_sessions.first.updated_at
          end
        end
      end
      
      file_data << header_line.join("\t") + "\n"
      
      data_lines_no.each do |data_line|
        file_data << data_line.join("\t") + "\n"
      end

      data_lines_yes.each do |data_line|
        file_data << data_line.join("\t") + "\n"
      end
      
      File.open(BASE_PATH + "no_yes_country_selector.txt", 'w') {|f| f.write(file_data) }
      puts "File written to #{BASE_PATH}no_yes_country_selector.txt"
    end


    desc "PageView Verteilung"
    task :country_names => :environment do

      countries = Visitor.all[0..500].inject([]) { |countries, visitor|  countries << ((visitor.country.name) if visitor.country_id) }
          
      File.open(BASE_PATH + "countries_after.txt", 'w') {|f| f.write("Countries\n" + countries.join("\n")) }

    end

    
    
  end