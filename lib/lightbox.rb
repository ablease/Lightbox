require 'sinatra/base'
require 'rack-flash'
require 'bcrypt'
require 'json'
require 'rest_client'

require_relative 'controllers/helpers.rb'
require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'controllers/rooms'
require_relative 'controllers/encryption'
require_relative 'data_mapper_setup'

class Lightbox < Sinatra::Base

  enable :sessions
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }
  set :public_folder, Proc.new { File.join(root, "..", "/public")}
  use Rack::Flash
  use Rack::MethodOverride

  # start the server if ruby file executed directly
  run! if app_file == $0
end
