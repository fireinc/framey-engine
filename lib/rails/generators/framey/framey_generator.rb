require 'rails/generators'
require 'rails/generators/migration'

class FrameyGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  argument :api_key, :type => :string, :required => false, :desc => "An API key is required to use famey. Get the api key from your account page on famey.com"
  argument :api_secret, :type => :string, :required => false, :desc => "A secret key is required to use famey. Get the api key from your account page on famey.com"

  def self.source_root
    sources = File.join(File.dirname(__FILE__), 'templates')
    
  end
   
  def self.next_migration_number(dirname) #:nodoc:
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end


  # Every method that is declared below will be automatically executed when the generator is run
  
  def create_migration_file
    f = File.open File.join(File.dirname(__FILE__), 'templates', 'schema.rb')
    schema = f.read; f.close
    
    schema.gsub!(/ActiveRecord::Schema.*\n/, '')
    schema.gsub!(/^end\n*$/, '')

    f = File.open File.join(File.dirname(__FILE__), 'templates', 'migration.rb')
    migration = f.read; f.close
    migration.gsub!(/SCHEMA_AUTO_INSERTED_HERE/, schema)
    
    tmp = File.open "tmp/~migration_ready.rb", "w"
    tmp.write migration
    tmp.close

    migration_template  '../../../tmp/~migration_ready.rb',
                        'db/migrate/create_framey_tables.rb'
    remove_file 'tmp/~migration_ready.rb'
  end

  def copy_initializer_file

    if self.api_key and self.api_secret
      f = File.open File.join(File.dirname(__FILE__), 'templates', 'initializer.rb')
      initializer = f.read; f.close
    
      initializer.gsub!(/API_KEY_VALUE/, self.api_key)
      initializer.gsub!(/API_SECRET_VALUE/, self.api_secret)
    
      tmp = File.open "tmp/~initializer_ready.rb", "w"
      tmp.write initializer
      tmp.close
    
      copy_file  '../../../tmp/~initializer_ready.rb',
                          'config/initializers/framey.rb'
      remove_file 'tmp/~initializer_ready.rb'
    else
      copy_file 'initializer.rb', 'config/initializers/framey.rb'
    end

  end
  
  def copy_views
    copy_file '../../../../../app/views/framey/videos/index.html.erb', 'app/views/framey/videos/index.html.erb'
    copy_file '../../../../../app/views/framey/videos/new.html.erb', 'app/views/framey/videos/new.html.erb'
    copy_file '../../../../../app/views/framey/videos/show.html.erb', 'app/views/framey/videos/show.html.erb'
    copy_file '../../../../../app/views/layouts/framey.html.erb', 'app/views/layouts/framey.html.erb'
  end
  
  def copy_controllers
    copy_file '../../../../../app/controllers/framey/videos_controller.rb', 'app/controllers/framey/videos_controller.rb'
  end
  
  def copy_models
    copy_file '../../../../../app/models/framey/video.rb', 'app/models/framey/video.rb'
  end
  
  
  
  
  
end
