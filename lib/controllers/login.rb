class Lightbox < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    verify_gmc(params[:gmc_number], params[:name])
    create_user
    sign_up_successful?
    flash[:notice] = "Your password doesn't match, please try again"
    redirect '/sign_up'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    login_successful?
    flash[:notice] = ["The email or password are incorrect"]
    redirect to('/login')
  end

  delete '/login' do
    session.clear
    flash[:notice] = ["Goodbye!"]
    redirect to('/')
  end

end

