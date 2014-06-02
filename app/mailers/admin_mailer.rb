class AdminMailer < ActionMailer::Base
  default from: "admin@grcoin.com"

  def notify_about_new producer
    @producer = producer
    to = 'test@grcoin.com'
    to = 'biodieselchris@gmail.com' if Rails.env.production?
    mail(to: to, subject: 'New Producer Signed Up')
  end
end
