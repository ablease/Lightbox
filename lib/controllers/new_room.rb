class Lightbox < Sinatra::Base

  post '/new_room' do 
    title = params["title"]
    url = "/chat_room/" + params["title"]
    Room.create(:url => url, :title => title)
    redirect to('/')
  end
end
