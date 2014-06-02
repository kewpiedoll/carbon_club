class Admin < ActiveRecord::Base
	def index
		@producers = Producer.all 
	end
end