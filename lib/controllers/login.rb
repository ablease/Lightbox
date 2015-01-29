class Lightbox < Sinatra::Base

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

