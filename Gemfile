source 'http://rubygems.org'

gem 'rails', '3.2.8'
gem 'haml-rails'
gem 'bcrypt-ruby', '3.0.1'
gem 'jquery-rails'
gem 'thread'
gem 'pry-rails'

group :production do
  gem 'pg'
	gem 'therubyracer', :platforms => :ruby
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
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'rubber'
gem 'open4'
gem 'gelf'
gem 'graylog2_exceptions', :git => 'git://github.com/wr0ngway/graylog2_exceptions.git'
gem 'graylog2-resque'
