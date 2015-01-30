require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RACK_ENV'] = 'test'

require './lib/lightbox'
require 'capybara/rspec'
require 'database_cleaner'


Capybara.app = Lightbox

RSpec.configure do |config|

  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end


