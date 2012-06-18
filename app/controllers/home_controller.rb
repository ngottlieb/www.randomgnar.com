class HomeController < ApplicationController
  
  def index   
    channel = Vimeo::Advanced::Channel.new("f2a3363dc779e60845cfd924a5d77aa5f9e41dec", "0bbf24e87757d3f934e1155a2f4d832785c5d29f",
                                            :token => "b670e5c76e7eca76b8e7c4c12476a3a3", 
                                            :secret => "3182b553b76b7ad632c02c6b7853c40f31b9aca6")
    
    @vid_embed = Vimeo::Advanced::Channel.new("f2a3363dc779e60845cfd924a5d77aa5f9e41dec", "0bbf24e87757d3f934e1155a2f4d832785c5d29f",
                                             :token => "b670e5c76e7eca76b8e7c4c12476a3a3", 
                                             :secret => "3182b553b76b7ad632c02c6b7853c40f31b9aca6")
    
    info = channel.get_info("whitewater")
    count = info["channel"]["total_videos"]
    video_number = rand(count.to_i)
    page = (video_number / 50).ceil + 1
    vid_index = video_number % 50

    videos = channel.get_videos("whitewater", page: page, per_page: "50")
    @video_id = videos["videos"]["video"][vid_index - 1]["id"]
  end
  
  def get_video_id
    channel = Vimeo::Advanced::Channel.new("f2a3363dc779e60845cfd924a5d77aa5f9e41dec", "0bbf24e87757d3f934e1155a2f4d832785c5d29f",
                                            :token => "b670e5c76e7eca76b8e7c4c12476a3a3", 
                                            :secret => "3182b553b76b7ad632c02c6b7853c40f31b9aca6")
    
    @vid_embed = Vimeo::Advanced::Channel.new("f2a3363dc779e60845cfd924a5d77aa5f9e41dec", "0bbf24e87757d3f934e1155a2f4d832785c5d29f",
                                             :token => "b670e5c76e7eca76b8e7c4c12476a3a3", 
                                             :secret => "3182b553b76b7ad632c02c6b7853c40f31b9aca6")
    
    info = channel.get_info("whitewater")
    count = info["channel"]["total_videos"]
    video_number = rand(count.to_i)
    page = (video_number / 50).ceil + 1
    vid_index = video_number % 50

    videos = channel.get_videos("whitewater", page: page, per_page: "50")
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
