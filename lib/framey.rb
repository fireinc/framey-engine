module Framey
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'acts_as_video/base'
  require 'application_controller'
  require 'httparty'
  require 'will_paginate'
  require 'api'
  require 'view_helpers'
end
