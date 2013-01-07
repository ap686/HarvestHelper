source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'haml-rails'
gem 'bcrypt-ruby', '3.0.1'
gem 'jquery-rails'
gem 'thread'
gem 'pry-rails'
gem 'devise'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'shoulda-matchers' # add libraries for rspec
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'bootstrap-sass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
