# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{framey}
  s.version = "0.0.0" 

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Your Name}]
  s.date = %q{2011-09-01}
  s.email = %q{you@email.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/controllers/framey/videos_controller.rb",
    "app/helpers/application_helper.rb",
    "app/helpers/framey/videos_helper.rb",
    "app/models/framey/video.rb",
    "app/views/framey/videos/index.html.erb",
    "app/views/framey/videos/show.html.erb",
    "app/views/layouts/fram.html.erb",
    "config/routes.rb",
    "lib/acts_as_video/base.rb",
    "lib/application_controller.rb",
    "lib/application_helper.rb",
    "lib/engine.rb",
    "lib/framey.rb",
    "lib/rails/generators/framey/framey_generator.rb",
    "lib/rails/generators/framey/templates/initializer.rb",
    "lib/rails/generators/framey/templates/migration.rb",
    "lib/rails/generators/framey/templates/schema.rb",
    "lib/rails/railties/tasks.rake",
    "public/stylesheets/framey.css"
  ]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Description of your gem}
  
  s.add_dependency('httparty')
  s.add_dependency('will_paginate', '~> 3.0.0')
    
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

