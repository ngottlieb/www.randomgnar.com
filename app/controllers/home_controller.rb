class HomeController < ApplicationController
  def index
    @videos = Vimeo::Simple::Channel.videos("whitewater")
  end
end
