module Framey
  module ActsAsVideo

    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def acts_as_video
        
          # This is where arbitrary code goes that you want to 
          # add to the class that declared "acts_as_widget"
          
          has_many :videos,  :class_name => 'Framey::Video'

          include Framey::ActsAsVideo::Base::InstanceMethods
        end
      end
    end

  end
end

::ActiveRecord::Base.send :include, Framey::ActsAsVideo::Base
