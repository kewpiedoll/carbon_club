class AdminMailer < ActionMailer::Base
  default from: "admin@carbon-club.com"

  def notify_about_new student
    @producer = producer
    to = 'admin@class-mngmt.com'
    to = 'biodieselchris@gmail.com' if Rails.env.production?
    mail(to: to, subject: 'New Student Signed Up')
  end
end
