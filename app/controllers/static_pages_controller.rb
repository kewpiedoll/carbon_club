class StaticPagesController < ApplicationController
  
  def home
    redirect_to producers_path if producer_signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end

  def news
  end

end

