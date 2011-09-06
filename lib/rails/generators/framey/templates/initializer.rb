module Framey
  class Engine < Rails::Engine

    config.mount_at = '/framey'
    config.video_factory_name = 'Factory Name'
        
  end
  
  API_HOST = "http://framey.com"
  RUN_ENV = "production"
  API_KEY = "API_KEY_VALUE"
  SECRET = "API_SECRET_VALUE"
  API_TIMEOUT = 15
end
