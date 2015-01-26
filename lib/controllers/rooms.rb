class Lightbox < Sinatra::Base

  get '/chat_room/*' do
   erb :chat_rooms
  end

  get "/chat_room/assets/js/application.js" do
    content_type :js
    @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
    erb :"application.js", :layout => false
  end

  post "/new_room" do 
    title = params["title"]
    url = "/chat_room/" + params["title"]
    Room.create(:url => title, :title => title)
    redirect to('/')
  end
end
