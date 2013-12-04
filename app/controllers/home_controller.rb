class HomeController < ApplicationController
  
  def index   
  end
  
  def get_video_id()
    channel_name = params[:channel]
    channel = Vimeo::Advanced::Channel.new(Figaro.env.vimeo_client_id, Figaro.env.vimeo_client_secret,
                                            :token => Figaro.env.vimeo_access_token,
                                            :secret => Figaro.env.vimeo_token_secret)
    
    @vid_embed = Vimeo::Advanced::Channel.new(Figaro.env.vimeo_client_id, Figaro.env.vimeo_client_secret,
                                            :token => Figaro.env.vimeo_access_token,
                                            :secret => Figaro.env.vimeo_token_secret)
    
    info = channel.get_info(channel_name)
    count = info["channel"]["total_videos"]
    video_number = rand(count.to_i)
    page = (video_number / 50).ceil + 1
    vid_index = video_number % 50

    videos = channel.get_videos(channel_name, page: page, per_page: "50")
    @video_id = videos["videos"]["video"][vid_index - 1]["id"]
    if @video_id
      respond_to do |format|
        format.html {  
          render :json => @video_id, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => @video_id
        }
      end
    end
  end
  
end
