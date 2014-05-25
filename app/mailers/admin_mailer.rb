class AdminMailer < ActionMailer::Base
  default from: "admin@carbon-club.com"

  def notify_about_new producer
    @producer = producer
    mail(to: 'admin@carbon-club.com', subject: 'New Producer Signed Up')
  end

end
