class Lightbox < Sinatra::Base

  get '/' do
    @rooms = Room.all
    erb :index
  end
end

