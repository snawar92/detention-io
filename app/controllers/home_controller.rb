class HomeController < ApplicationController

  def home
    @links = Link.all.order('created_at DESC')
  end

end
