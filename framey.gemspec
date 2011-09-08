# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{framey}
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Dave Renz}]
  s.date = %q{2011-09-08}
  s.description = %q{A gem for easy Rails integration with the Framey video recording service.}
  s.email = %q{david@qlabs.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "app/controllers/framey/videos_controller.rb",
    "app/helpers/application_helper.rb",
    "app/helpers/framey/videos_helper.rb",
    "app/models/framey/video.rb",
    "app/views/framey/videos/index.html.erb",
    "app/views/framey/videos/new.html.erb",
    "app/views/framey/videos/show.html.erb",
    "app/views/layouts/framey.html.erb",
    "config/routes.rb",
    "lib/acts_as_video/base.rb",
    "lib/api.rb",
    "lib/application_controller.rb",
    "lib/application_helper.rb",
    "lib/engine.rb",
    "lib/framey.rb",
    "lib/rails/generators/framey/framey_generator.rb",
    "lib/rails/generators/framey/templates/initializer.rb",
    "lib/rails/generators/framey/templates/migration.rb",
    "lib/rails/generators/framey/templates/schema.rb",
    "lib/rails/railties/tasks.rake",
    "lib/view_helpers.rb",
    "public/images/cheese.jpg",
    "public/javascripts/swfobject.js",
    "public/player.swf",
    "public/recorder.swf",
    "public/stylesheets/framey.css"
  ]
  s.homepage = %q{http://framey.com}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{A gem for easy Rails integration with the Framey video recording service.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<will_paginate>, ["~> 3.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<will_paginate>, ["~> 3.0.0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<will_paginate>, ["~> 3.0.0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

