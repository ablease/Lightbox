class Lightbox < Sinatra::Base

  get '/chat_room/london_mdt' do
   erb :chat_rooms
  end

end