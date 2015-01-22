require 'data_mapper'

env = ENV['Rack_Env'] || 'development'

DataMapper.setup(:default, "postgres://localhost/lightbox_#{env}")

require './lib/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
