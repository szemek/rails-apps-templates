#!/usr/bin/env ruby

if $0 == __FILE__
  app = ARGV.first || "app"
  exec "rails new #{app} --skip-bundle --skip-active-record -m #{__FILE__}"
end

gem 'mongoid', github: 'mongoid/mongoid'
gem 'haml-rails'

gem_group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'colored'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'pry-rails'
end

route "root to: 'dashboard#index'"

file "app/controllers/dashboard_controller.rb", <<CODE
class DashboardController < ApplicationController
  def index
  end
end
CODE

file "app/views/dashboard/index.haml", <<CODE
%h1 Dashboard
CODE

run 'bundle install'

generate 'mongoid:config'

gsub_file 'config/mongoid.yml', /(^\s+#.+\n)+/, ''

git :init
git add: "."
git commit: "-a -m 'Initial commit'"
