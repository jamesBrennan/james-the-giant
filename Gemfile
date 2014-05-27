source 'https://rubygems.org'

# Heroku uses the ruby version to configure your application's runtime.
ruby '2.1.2'

gem 'unicorn'

gem 'rails', '~> 4.0.0.rc2'
gem 'pg'

gem 'slim-rails'
gem 'less-rails'
gem 'less-rails-bootstrap'
gem 'jquery-rails'
gem 'turbolinks'
gem 'coffee-rails'
gem 'simple_form', '~> 3.0.0.rc'
gem 'uglifier'
gem 'awesome_print'
gem 'newrelic_rpm'

gem 'omniauth'
gem 'omniauth-google-oauth2', '0.2.2'                  # Latest version results in an auth failure.

# Heroku suggests that these gems aren't necessary, but they're required to compile less assets on deploy.
gem 'therubyracer', platforms: :ruby

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'simplecov'
  gem 'launchy'
end

group :development do
  gem 'foreman'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'cucumber-rails', require: false
end
