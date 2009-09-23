class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'queputamierda.com - Te has registrado'
  
    @body[:url]  = "http://www.queputamierda.com/activate/#{user.activation_code}"  
  end

  
  def activation(user)
    setup_email(user)
    @subject    += 'Registro en www.queputamierda.com'
    @body[:url]  = "http://www.queputamierda.com/"
  end


  def suggestions_newsletter(email)
    puts "sending mail to: " + email

    @recipients   = "#{email}"
    @from         = "queputamierda.com <admin@queputamierda.com>"
    @subject      = "Nuevo queputamierda.com"
    @reply_to     = "admin@queputamierda.com"
    @sent_on      = Time.now

  end


  def new_comment(story)
    if story.user.present?
      @recipients = story.user.email
    elsif
      @recipients = story.email      
    end
    
    puts "sending mail to: " + @recipients 
    
    @from        = "queputamierda.com <admin@queputamierda.com>"    
    @subject = 'queputamierda.com - Nuevo comentario.'

    @body[:story]  = story
  end

  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "queputamierda.com <admin@queputamierda.com>"
      @subject     = ""
      @reply_to     = "admin@queputamierda.com"
      @sent_on     = Time.now
      @body[:user] = user
    end
        
end
