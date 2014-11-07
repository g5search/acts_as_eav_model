
# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rspec/rails"

#ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = false
#ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
#require "capybara/rails"
#Capybara.default_driver   = :rack_test
#Capybara.default_selector = :css

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
plugin_fixture_path = File.expand_path(File.dirname(__FILE__) + "/fixtures/")
$LOAD_PATH.unshift(plugin_fixture_path)

RSpec.configure do |config|
  # Remove this line if you don't want Rspec's should and should_not
  # methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers
  config.infer_spec_type_from_file_location!

  # == Mock Framework
  config.mock_with :rspec
  config.fixture_path=plugin_fixture_path
end
load(File.dirname(__FILE__) + "/dummy/db/schema.rb")