class Mailer < ActionMailer::Base

def mailing(contact,couriel,email_prof,file)
      @from  = "#{email_prof}"
      @recipients = "#{couriel}"
      @subject     = contact.subject
      @sent_on     = Time.now
      @body[:message] = contact.message
      
      #attachement
      unless file.blank?
     #   attachment  :body => file.read, :filename => file.original_filename
          attachment "application/octet-stream" do |a|
            a.body = file.read
            a.filename = file.original_filename
          end
      end
    end
end



