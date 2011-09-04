ENV["RAILS_ENV"] = "test"

require 'test/unit'
require 'rubygems'
require 'yaml'
require 'active_record'
require 'mysql'

require 'app/models/framey/video.rb'

def framey_video( fixture_name )
  id = @@fixtures['framey_video'][ fixture_name.to_s ][ 'id' ]
  Cheese::Widget.find( id )
end

def load_schema
  config = YAML::load( IO.read( File.dirname(__FILE__) + '/database.yml') )

  # Manually initialize the database
  conn = Mysql.real_connect( config['mysql']['host'], config['mysql']['username'], config['mysql']['password'] )
  conn.query( "CREATE DATABASE IF NOT EXISTS #{config['mysql']['database']}" )
  
  ActiveRecord::Base.establish_connection( config['mysql'] )
  ActiveRecord::Base.connection()
  
  load(File.dirname(__FILE__) + "/../" +
    "lib/rails/generators/framey/templates/schema.rb")

  @@fixtures = {}
  
  load_fixture( 'framey_video' )
end

def load_fixture( table )
  @@fixtures[ table ] = {}
  fixture = YAML::load( IO.read( File.dirname(__FILE__) + "/fixtures/#{table}.yml") )
  @@fixtures[ table ] = fixture

  klass = class_eval table.titleize.gsub(/ /, '::')

  fixture.each do |record_name, record|
    record.each do |column, value|
      if ( match = column.match(/(.*)_id/) )
        fixture_reference = "framey_" + match[1].pluralize
        if value.is_a? Symbol
          r = class_eval "#{fixture_reference}( '#{value}' )"
          record[ column ] = r.id
        end
      end
    end
      
    r = klass.create( record )
    @@fixtures[ table ][ record_name ][ 'id' ] = r.id
  end

end
