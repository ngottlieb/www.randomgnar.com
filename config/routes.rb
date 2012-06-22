Randomkayakvideo::Application.routes.draw do
  root :to => "home#index"

  match 'video/:channel' => 'home#get_video_id'

end
