require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

configure :development, :test do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/lightbox_#{env}")
end

require './lib/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!

