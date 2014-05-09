class EnergySystem < ActiveRecord::Base
	has_many :registrations
	has_many :producers, through: :registrations

	scope :pv_solar, -> { where CO2_rating: '46' }
end
