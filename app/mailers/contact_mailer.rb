class ContactMailer < ApplicationMailer
  def contact_mail(contact, user)
    @contact = contact
    mail to: "linkwood.0609@gmail.com", bcc: "linkwood.0609@gmail.com", subject: "お問い合わせについて【自動送信】"
  end
end
