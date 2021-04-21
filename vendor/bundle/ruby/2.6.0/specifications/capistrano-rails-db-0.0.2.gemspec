# -*- encoding: utf-8 -*-
# stub: capistrano-rails-db 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-rails-db".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kentaro Imai".freeze]
  s.date = "2015-03-19"
  s.description = "Rails migration tasks for Capistrano v3".freeze
  s.email = ["kentaroi@gmail.com".freeze]
  s.homepage = "https://github.com/kentaroi/capistrano-rails-db".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Rails migration tasks for Capistrano v3".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano-rails>.freeze, ["~> 1.1"])
    else
      s.add_dependency(%q<capistrano-rails>.freeze, ["~> 1.1"])
    end
  else
    s.add_dependency(%q<capistrano-rails>.freeze, ["~> 1.1"])
  end
end
