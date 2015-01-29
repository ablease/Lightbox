require "json"
require_relative './helpers.rb'

class Lightbox < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    verify_gmc(params[:gmc_number], params[:name])
    @new_user = User.create!(name: params[:name],
                            email: params[:email],
                            rsakeypub: params[:genratepub_kay],
                            password: params[:password],
                            password_confirmation: params[:password_confirmation],
                            gmc_number: params[:gmc_number]
                            )

    if 	@new_user.save
      session[:user_id] = @new_user.id
      flash[:notice] = "Successfully signed up"
      redirect '/'
    else
      flash[:notice] = "Your password doesn't match, please try again"
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

  delete '/login' do
    session.clear
    flash[:notice] = ["Goodbye!"]
    redirect to('/')
  end

  get '/pub_keys' do
    user_json= []
    User.each do |user_add|
      user_to_add = { email: user_add.email, rsakeypub: user_add.rsakeypub }
      user_json << user_to_add
    end
    user_json.to_json
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

end

