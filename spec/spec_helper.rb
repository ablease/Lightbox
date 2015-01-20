ENV['RACK_ENV'] = 'test'
require 'lightbox'
require 'capybara/rspec'


Capybara.app = Lightbox
