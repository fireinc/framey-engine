require 'framey'
require 'rails'
require 'action_controller'
require 'application_helper'

module Framey
  class Engine < Rails::Engine

    # Config defaults
    config.video_factory_name = "default factory name"
    config.mount_at = '/framey'
    
    # Load rake tasks
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'rails/railties/tasks.rake')
    end
    
    # Check the gem config
    initializer "check config" do |app|

      # make sure mount_at ends with trailing slash
      config.mount_at += '/'  unless config.mount_at.last == '/'
    end
    
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
    
  end
end
