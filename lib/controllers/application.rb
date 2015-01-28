class Lightbox < Sinatra::Base

  get '/' do
    @rooms = Room.all
    erb :index
  end

  get '/Referral' do 
    erb :refer
  end

end
