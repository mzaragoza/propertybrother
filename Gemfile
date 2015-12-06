source 'https://rubygems.org'

# System
ruby '2.2.1'
gem 'rails', '4.2.3'                                  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

#Database
gem 'pg'                                              # Use postgress as the database for Active Record

# Services

# Engines

# Layout
gem "haml-rails"                                       # format templates
gem 'simple_form'                                      # form helpers

# Security
gem "devise" # For user registration
gem 'bcrypt-ruby'
gem 'paper_trail', '~> 4.0.0'                          # Track changes to your models, for auditing or versioning

# Tools
gem 'decent_exposure'                                  # A helper for creating declarative interfaces in controllers
gem 'lazy_high_charts'                                 # Charts

# Images

# Payment
gem 'stripe'

# For file uploads
gem "carrierwave"
#
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server

# Use Capistrano for deployment


group :production do
 #  gem "unicorn"

  # Monitor app with New Relic
  #gem 'newrelic_rpm'
  #

  gem "rails_12factor", group: :production  # 12 Factor gem for Heroku
end


group :development, :test do
  gem "spring-commands-rspec"
  gem "yapt", require: false
  gem 'awesome_print' # Awesome Print is a Ruby library that pretty prints Ruby objects in full color exposing their internal structure with proper indentation.
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano-rails'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'  # For fake data
  gem 'git-pairing'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-spring', require: false
  gem 'jasmine'
  gem 'jasmine-jquery-rails'
  gem 'metric_fu'
  gem 'pivotal-tracker'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'quiet_assets' # Quiet Assets turns off the Rails asset pipeline log
  gem 'rack-mini-profiler', require: false
  gem 'railroady'
  gem 'rb-readline'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails', ">= 3.1"  # Use rspec-style tests
  gem 'spring'
  gem 'ultrahook'
end

group :test do
  # For testing the full stack
  gem 'capybara', '> 2.3.0'
  #gem 'capybara-webkit', '> 1.1.0'
  # To controll a browser
  gem 'selenium-webdriver'

  # For removing remanants of test records
  gem 'database_cleaner'

  # Use gem minitest instead of older packaged-with-Ruby minitest
  gem 'minitest'


  # For fancy Active Record matchers
  gem 'shoulda-matchers', require: false

  # For opening save_and_open_page automatically
  gem 'launchy'

  # Is all the code test covered?
  gem 'simplecov', :require => false

  # For testing search
  gem 'sunspot-rails-tester'

  # library for stubbing and setting http requests
  gem 'webmock'
  gem 'vcr'
  gem 'carrierwave_direct'

  # For retrying unreliable tests
  gem 'rspec-retry'
  gem 'capybara-select2' # allow you to trigger select2 dropdown to select

  # For manipulating TIME ITSELF
  gem "timecop"
end

# Documentation
group :doc do
  gem 'sdoc', '~> 0.4.0'
end
