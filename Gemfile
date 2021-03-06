source 'https://rubygems.org'

# For Heroku - see https://devcenter.heroku.com/articles/getting-started-with-rails4
ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'annotate', '~> 2.5'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end

# For Heroku, see https://devcenter.heroku.com/articles/getting-started-with-rails4
gem 'rails_12factor', group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'omniauth-google-oauth2', '~> 0.2'
gem 'devise', '~> 3.2'

group :assets do
  gem 'therubyracer', :platforms => :ruby
end
gem 'less-rails', '~> 2.8' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails', '~> 2.2'

gem 'activeadmin', '~> 1.0'

gem 'rest-client', '~> 1.7'
gem 'newrelic_rpm', '~> 3.9'

gem 'coveralls', '~> 0.7', require: false
gem 'intercom-rails', '~> 0.2'
gem 'bugsnag', '~> 2.5'
gem 'airbrake', '~> 4.0'
gem 'sentry-raven', '~> 0.12', '>= 0.12.2'
