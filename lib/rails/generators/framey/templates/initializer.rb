module Framey
  class Engine < Rails::Engine

    config.mount_at = '/framey'
    config.video_factory_name = 'Factory Name'
        
  end
  
  API_HOST = "http://framey.com"
  RUN_ENV = "production"
  API_KEY = ""
  SECRET = ""
  API_TIMEOUT = 15
end
