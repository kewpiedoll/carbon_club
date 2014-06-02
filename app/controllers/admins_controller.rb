class AdminsController < ApplicationController
	def index
		@producers = Producer.all
	end
end
