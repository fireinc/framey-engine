require 'rake/testtask'


begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "framey"
    gem.summary = "A gem for easy Rails integration with the Framey video recording service."
    gem.description = "TO DO"
    gem.email = "david@qlabs.com"
    gem.authors = ["Dave Renz"]
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{public}/**/*", "{config}/**/*"]
    gem.homepage = "http://framey.com"
    gem.add_dependency 'httparty'
    gem.add_dependency 'will_paginate', '~> 3.0.0'
    gem.add_development_dependency 'jeweler'


  end
  Jeweler::GemcutterTasks.new
rescue
  puts "Jeweler or dependency not available."
end
