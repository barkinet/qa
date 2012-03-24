source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'bootstrap-sass', git: 'git://github.com/thomas-mcdonald/bootstrap-sass.git', branch: '2.0.2'
gem 'jquery-rails'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  # Guard for autorunning tests
  gem 'guard', '1.0.1'
  gem 'guard-cucumber', '0.7.5'
  gem 'guard-rspec', '0.6.0'
end

group :development, :test do
  gem 'rspec-rails', '2.9.0'
end

group :test do
  gem 'cucumber-rails', '1.3.0'
  gem 'database_cleaner', '0.7.2'
end