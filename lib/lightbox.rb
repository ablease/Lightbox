require 'sinatra/base'
require 'rack-flash'
require 'bcrypt'

require_relative 'controllers/application'
require_relative 'controllers/users'
#require_relative 'controllers/sockets'
require_relative 'controllers/rooms'
require_relative 'data_mapper_setup'

class Lightbox < Sinatra::Base

  enable :sessions
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }
  set :public_folder, Proc.new { File.join(root, "..", "/public")}
  use Rack::Flash
  use Rack::MethodOverride

  :a
  :sa
  :wq
  :q

  run! if app_file == $0
end