source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'mysql2', '~> 0.3.13'
gem 'mongoid'
gem 'devise'
gem 'inherited_resources'
gem 'has_scope'
gem "active_model_serializers"
gem 'date_validator'
gem 'ecconnect_rails', '>= 0.0.3'
gem 'rvm-capistrano'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-rails'
  gem 'bootstrap-datepicker-rails'
  #gem 'haml_coffee_assets'
  #gem 'execjs'
  #gem 'normalize-rails'
  #gem 'compass-rails'
  gem 'uglifier', '>= 1.0.3'
  #gem "jquery-fileupload-rails"
  gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
  #gem 'angular-rails'
  #gem 'showdown-rails'
end

group :production do
  gem "unicorn", ">= 4.3.1"
end

group :development do
  gem "haml-rails", ">= 0.3.5"
  gem "hpricot", ">= 0.8.6"
  gem "ruby_parser", ">= 3.1.0"
  gem "quiet_assets", ">= 1.0.1"
  gem "better_errors", ">= 0.2.0"
  gem "binding_of_caller", ">= 0.6.8"
  gem 'thin'
end

group :test do
  gem "database_cleaner"
  #gem "email_spec"
  gem "launchy"
  gem "capybara"
  gem 'webmock'
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "jasminerice"
  gem 'mongoid-rspec'
end

gem 'cache_digests'
gem 'redis-rails'
gem 'haml'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'simple_form'

#gem 'delayed_job_active_record'
gem 'delayed_job_mongoid'
gem 'figaro'

gem 'mongoid_slug'
gem 'mongoid_auto_inc'