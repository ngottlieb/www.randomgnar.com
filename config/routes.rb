Randomkayakvideo::Application.routes.draw do
  root :to => "home#index"

  match 'video' => 'home#get_video_id'

end
