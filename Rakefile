require 'rake/testtask'

Rake::TestTask.new do |test|
  test.pattern = 'test/**/*_test.rb'
  test.libs << 'test'
end


begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "framey"
    gem.summary = "A gem for easy Rails integration with the Framey video recording service."
    gem.email = "david@qlabs"
    gem.authors = ["Dave Renz"]
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{public}/**/*", "{config}/**/*"]
    gem.add_dependency 'httparty'
    gem.add_dependency 'will_paginate', '~> 3.0.0'
    gem.homepage = "http://framey.com"
  end
  Jeweler::GemcutterTasks.new
rescue
  puts "Jeweler or dependency not available."
end
