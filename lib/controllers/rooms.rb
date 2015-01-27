class Lightbox < Sinatra::Base

  get '/chat_room/assets/js/application.js' do
    content_type :js
    @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
    erb :"application.js", :layout => false
  end

  get '/chat_room/*' do
    @name = params[:splat]
    erb :chat_rooms
  end

  post '/new_room' do 
    title = params["title"]
    url = "/chat_room/" + params["title"]
    Room.create(:url => url, :title => title)
    redirect to('/')
  end

  delete '/chat_room/:id' do |id|
    puts id
    room = Room.get!(id)
    p room
    room.destroy!
    flash[:notice] = ["Room deleted sucessfully"]
    redirect to ('/') 
  end
end