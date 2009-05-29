namespace :titles do
    desc "Migrates DB to Version=0 imports geodata and universities, clones db to test_db, imports data for test_db"
    task :generate => :environment do

      Story.all.each do |story|
          story.title = story.body[0..(60+ (story.body[60..100].index(" ")))]
          story.save!
      end

    end
end