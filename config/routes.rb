Rails.application.routes.draw do |map|

  mount_at = Framey::Engine.config.mount_at

  match mount_at => 'framey/videos#index'
  
  map.resources :videos, :only => [ :index, :show, :new],
                          :controller => "framey/videos",
                          :path_prefix => mount_at,
                          :name_prefix => "framey_"
  post "/framey/callback" => "framey/videos#callback"

end
