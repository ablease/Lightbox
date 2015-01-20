require 'sinatra/base'
require 'rack-flash'
require 'data_mapper'
require 'bcrypt'

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
    @new_user = User.create(name: params["name"], email: params["email"], password: params["password"], password_confirmation: params["password_confirmation"])
    if 	@new_user.save
      session[:user_id] = @new_user.id
      flash[:notice] = "Successfully signed up"
      redirect '/'
    else
      flash[:notice] = "Your passwort doesn't match, please try again"
      redirect '/sign_up'
    end

  end

  get '/login' do
    erb :login
  end

  post 'login' do
    email, password = params[:email], params[:password]
    user= User.authenticate(email, password)

    if user
      session[:user_id] = user.id
      redirect '/'
      flash[:notice] = ["You are logged in"]
    else
      flash[:notice] = ["The email or password are incorrect"]
      redirect '/login'
    end
  end





  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
