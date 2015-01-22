require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/lightbox_#{env}")

require './lib/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
