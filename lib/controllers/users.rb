class Lightbox < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    verify_gmc(params[:gmc_number], params[:name])
    create_user
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

end

