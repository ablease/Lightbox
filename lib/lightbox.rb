require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'

env = ENV['Rack_Env'] || 'development'

DataMapper.setup(:default, "postgres://localhost/lightbox_#{env}")

require './lib/user'

DataMapper.finalize

DataMapper.auto_upgrade!

class Lightbox < Sinatra::Base

  enable :sessions
  use Rack::Flash

  set :views, Proc.new { File.join(root,"..", "views") }

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    flash[:notice] = "Successfully signed up"
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
