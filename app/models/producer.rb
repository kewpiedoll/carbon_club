class Producer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable  -- confirmable "added" below and removed from here
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	has_many :registrations
	has_many :energy_systems, through: :registrations

  after_create :notify_admin

  scope :founder, -> { where user_name: 'Chris' }
end

  private

  def notify_admin
    AdminMailer.notify_about_new(self).deliver
  end
