module Framey
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'acts_as_video/base'
  require 'application_controller'
  require 'api'
end
