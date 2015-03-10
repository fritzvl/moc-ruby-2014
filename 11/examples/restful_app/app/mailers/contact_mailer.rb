class ContactMailer < ApplicationMailer

  default from: 'contact@masterofcode.com'

  def contact_email(message)
    @message=message
    mail(to: "bogdan@masterofcode.com", subject: "Contact form request from #{@message[:name]}")
  end

end
