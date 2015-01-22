require 'sinatra/base'
require 'rack-flash'
require 'bcrypt'
require 'em-websocket'

require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'data_mapper_setup'

class Lightbox < Sinatra::Base

  enable :sessions
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }
  use Rack::Flash
  use Rack::MethodOverride

  get '/chat_rooms/london_mdt' do
   erb :chat_rooms
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
