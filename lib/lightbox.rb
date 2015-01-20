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
    @new_user = User.create(name: params["name"], email: params["email"], password: params["password"])
    if 	@new_user.save
      session[:user_id] = @new_user.id
      flash[:notice] = "Successfully signed up"
      redirect '/'
    else
      flash[:notice] = "Your passwort doesn't match, please try again"
      redirect '/sign_up'
    end

  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
