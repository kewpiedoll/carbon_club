class Producer < ActiveRecord::Base
	has_many :registrations
	has_many :energy_systems, through: :registrations

  scope :founder, -> { where user_name: 'Chris' }
end
