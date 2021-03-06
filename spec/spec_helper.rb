if ENV['CI']
  require 'coveralls'
  Coveralls.wear_merged!('rails')
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
ENV["RSPEC"] = 'true'

# special test support/matchers for gems
require 'sidekiq'
require 'sidekiq/testing'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'pundit/rspec' # require *after* shoulda-matchers to override pundit

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_framework = :mocha

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # decide what spec type to use based on file location
  config.infer_spec_type_from_file_location!

  config.include ActiveSupport::Testing::TimeHelpers
  config.include UserSupport, type: :controller

  config.before(:suite) do
    ActiveRecord::Migration.maintain_test_schema!

    # set up database cleaner
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
    Sidekiq::Testing.fake!

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      info: {
        email: 'example@google.com',
        name: 'John Doe'
      },
      provider: 'google',
      uid: 'https://www.google.com/accounts/o8/id?id=fakeuid'
    })
  end

  config.before(:each) do
    DatabaseCleaner.start
    Sidekiq::Worker.clear_all
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
