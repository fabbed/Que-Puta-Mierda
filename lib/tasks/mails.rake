namespace :mail do

    desc "Calculates statistics"
    task :delete_doubles => :environment do

        NewsletterRegistration.find_by_sql("SELECT id, email, count(*) AS cnt FROM newsletter_registrations GROUP BY email HAVING cnt > 1").each do |story|
          puts
          newsletter_obj=NewsletterRegistration.find_by_id(story.id)
          puts "ID: #{newsletter_obj.id}, email: " + newsletter_obj.email
          newsletter_registrations_with_same_email = NewsletterRegistration.find(:all, :conditions => ['email = ?', story.email])

          puts "# Same newsletter_registrations: #{newsletter_registrations_with_same_email.size}"

          newsletter_registrations_with_same_email[1..newsletter_registrations_with_same_email.size].each do |story_to_delete|
            puts "To delete: " + story_to_delete.id.to_s
            story_to_delete.destroy
          end
    
        end
    end



    desc "Calculates statistics"
    task :delete_bad_ones => :environment do
      
      NewsletterRegistration.find(:all, :conditions => ['email NOT LIKE ?', "%@%"]).each do |nl|
        nl.destroy
      end
      
    end





    desc "Calculates statistics"
    task :send_first_newsletter => :environment do
      
      NewsletterRegistration.all.each do |recipient|
        # if recipient.email == "fabian.dittrich@gmail.com" or recipient.email == "contiosofleming@gmail.com"
          
          if recipient.nl1 != true
            UserMailer.deliver_suggestions_newsletter(recipient.email)
            recipient.nl1 = true
            recipient.save
          end
          
        # end
      end
      
    end



end
