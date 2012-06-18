class HomeController < ApplicationController
  def index
    @videos = Vimeo::Simple::Channel.videos("whitewater")
    @video_to_play = @videos[rand(@videos.count) - 1]
  end
end
