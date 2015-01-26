class Lightbox < Sinatra::Base

  get '/chat_room/london_mdt' do
   erb :chat_rooms
  end

  get "/chat_room/assets/js/application.js" do
    content_type :js
    @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
    erb :"application.js", :layout => false
  end
end
