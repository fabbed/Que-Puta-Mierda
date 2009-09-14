# rake stories:assign_comments
# rake stories:delete_doubles
# rake stories:find_long_words
# rake db:migrate
# rake stories:get_countries
# rake stories:get_real_country_names

# RAILS_ENV=production rake stories:assign_comments
# RAILS_ENV=production rake stories:delete_doubles
# RAILS_ENV=production rake stories:find_long_words
#RAILS_ENV=production stories:get_real_country_names
namespace :stories do

    desc "delete doubles"
    task :assign_comments => :environment do
      

    Story.find_by_sql("SELECT id, title, count(*) AS cnt FROM stories GROUP BY title HAVING cnt > 1").each do |story|
      puts
      story_obj=Story.find_by_id(story.id)
      puts "ID: #{story_obj.id}, TITLE: " + story_obj.title
      stories_with_same_title = Story.find(:all, :conditions => ['title = ?', story.title])
      puts "# Same stories: #{stories_with_same_title.size}"

      stories_with_same_title[1..stories_with_same_title.size].each do |story_to_delete|
        story_obj.comments=story_obj.comments | story_to_delete.comments
      end

      stories_with_same_title[1..stories_with_same_title.size].each do |story_to_delete|
        puts "To delete: " + story_to_delete.id.to_s
        # story_to_delete.destroy
      end
      
      puts "# Comments original story: #{story_obj.comments.size}"
      
    end
      
end

    desc "delete doubles"
    task :delete_doubles => :environment do
      

    Story.find_by_sql("SELECT id, title, count(*) AS cnt FROM stories GROUP BY title HAVING cnt > 1").each do |story|
      puts
      story_obj=Story.find_by_id(story.id)
      puts "ID: #{story_obj.id}, TITLE: " + story_obj.title
      stories_with_same_title = Story.find(:all, :conditions => ['title = ?', story_obj.title])

      stories_with_same_title[1..stories_with_same_title.size].each do |story_to_delete|
        puts "To delete: " + story_to_delete.id.to_s
        story_to_delete.destroy
      end

    end
  end


    desc "Migrates DB to Version=0 imports geodata and universities, clones db to test_db, imports data for test_db"
    task :get_real_country_names => :environment do

    
      Story.all.each do |story|

        if story.country_code!="xx" and story.country_code
          puts story.country_code
          puts story.id
          
          story.country_name = Country.find_by_iso(story.country_code.upcase).name
          story.save
        end
        
      end
    end



    desc "Migrates DB to Version=0 imports geodata and universities, clones db to test_db, imports data for test_db"
    task :find_long_words => :environment do
      Story.all.each do |story|
        
        indexes=[]
        long_title = false
        
        title_as_array = story.body.split(" ")
        
        story.body.split(" ").each_with_index do |word, i|
          if word.length > 35
            puts "id: #{story.id}, body: #{story.body}"
            indexes << i
            long_title = true
          end
        end
        
        if long_title
          indexes.each do |index|
            title_as_array[index] = title_as_array[index][0..20]
          end
        
          story.body = title_as_array.join(" ")
          if story.body.length < 100
            story.destroy
          else
            story.save!
          end

          puts story.body
          puts
        end

      end
    end


    desc "Migrates DB to Version=0 imports geodata and universities, clones db to test_db, imports data for test_db"
    task :get_countries => :environment do

      require 'geokit'

      Geokit::Geocoders::google = 'ABQIAAAAq41jgnMAVw_fZQq0XgCgOxTJQa0g3IQ9GZqIMmInSLzwtGDKaBQs02mhfURaIntuWJUEHCe7OlHgpg'

      Story.all.each do |story|
        

        unless true
          location = GeoKit::Geocoders::GeoPluginGeocoder.geocode("189.152.195.113")
          puts location.to_yaml
        else

          if !story.ip
            story.country_code = "xx"
            story.save
          elsif story.ip and !story.country_id
            # location = GeoKit::Geocoders::IpGeocoder.geocode(story.ip)
            location = GeoKit::Geocoders::GeoPluginGeocoder.geocode("#{story.ip}")            
            if location.success
              puts location.country_code
              story.country_code = location.country_code
              story.country_id = Country.find_by_iso(location.country_code).id
              story.city = location.city if location.city
              story.save
              # location.lat
              # location.lng
              # location.city
            else
              story.country_id = nil
              story.country_code = "xx"
              story.save
            end
          end
        end
      end


        
        #geocode with ip
        #set countryid and country

    end
end