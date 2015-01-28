class Lightbox < Sinatra::Base

  get '/' do
    @rooms = Room.all
    erb :index
  end

  get '/Referral' do 
    erb :refer
  end
  
  post '/referral' do
    flash[:notice] = "Email Sent"
    redirect '/'
  end
end
