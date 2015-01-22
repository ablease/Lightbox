require 'sinatra/base'
require 'rack-flash'
require 'bcrypt'
require 'em-websocket'

require_relative 'data_mapper_setup'

#DataMapper.setup(:default, "postgres://localhost/lightbox_#{env}")

#require './lib/models/user'

#DataMapper.finalize

#DataMapper.auto_upgrade!


class Lightbox < Sinatra::Base

  enable :sessions
  use Rack::Flash

  set :views, Proc.new { File.join(root, "/views") }

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

    post '/login' do
      email, password = params[:email], params[:password]
      user = User.authenticate(email, password)

      if user
        session[:user_id] = user.id
        flash[:notice] = "Successfully logged in"
        redirect to('/')
      else
        flash[:notice] = ["The email or password are incorrect"]
        redirect to('/login')
      end
    end
   
  get '/mdts/london_mdt' do
   erb :mdts
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end
    

     
    # start the server if ruby file executed directly
    run! if app_file == $0
end
