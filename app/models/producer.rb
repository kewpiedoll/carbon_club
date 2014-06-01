class Producer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable  -- confirmable "added" below and removed from here
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	has_many :registrations
	has_many :energy_systems, through: :registrations

  after_create :send_admin_mail
  
  scope :founder, -> { where user_name: 'Chris' }
  
  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

  private

  # def notify_admin
  #   AdminMailer.notify_about_new(self).deliver
  # end

  def send_admin_mail
    AdminMailer.new_producer_waiting_for_approval(self).deliver
  end

end