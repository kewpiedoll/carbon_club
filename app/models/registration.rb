class Registration < ActiveRecord::Base
	belongs_to :producer
	belongs_to :energy_system
end
