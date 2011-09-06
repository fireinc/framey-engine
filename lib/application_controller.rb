module Framey
  ## Define ControllerMethods
  module Controller
  	## this one manages the usual self.included, klass_eval stuff
    extend ActiveSupport::Concern

  end
end

::ActionController::Base.send :include, Framey::Controller


