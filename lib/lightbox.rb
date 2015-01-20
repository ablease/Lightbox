require 'sinatra/base'

class Lightbox < Sinatra::Base
  get '/' do
    'Hello Lightbox!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
