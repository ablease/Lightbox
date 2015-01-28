require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/lightbox_#{env}")

require './lib/models/user'
require './lib/models/room'

DataMapper.finalize

DataMapper.auto_upgrade!
