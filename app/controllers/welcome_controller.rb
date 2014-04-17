class WelcomeController < ApplicationController
  def index
  	@time_now = Time.now
  end  
end
