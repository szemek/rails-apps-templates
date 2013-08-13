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

git :init
git add: "."
git commit: "-a -m 'Initial commit'"
