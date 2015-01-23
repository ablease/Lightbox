require 'sinatra/base'
require 'sinatra-rocketio'
require 'rack-flash'
require 'bcrypt'
require 'em-websocket'

require_relative 'controllers/application'
require_relative 'controllers/users'
require_relative 'data_mapper_setup'

class Lightbox < Sinatra::Base
  register Sinatra::RocketIO
  io = Sinatra::RocketIO

  enable :sessions
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "/views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }
  use Rack::Flash
  use Rack::MethodOverride

  io.once :start do
    puts "RocketIO start!!!"
  end

  io.on :connect do |client|
    puts "new client  - #{client}"
    push :chat, {:name => "system", :message => "new #{client.type} client <#{client.session}>"}, :channel => client.channel
    push :chat, {:name => "system", :message => "welcome <#{client.session}>"}, :to => client.session
  end

  io.on :disconnect do |client|
    puts "disconnect client  - #{client}"
    push :chat, {:name => "system", :message => "bye <#{client.session}>"}, :channel => client.channel
  end

  io.on :chat do |data, client|
    puts "#{data['name']} : #{data['message']}  - #{client}"
    push :chat, data, :channel => client.channel
  end

  io.on :error do |err|
    STDERR.puts "error!! #{err}"
  end

  get '/chat_room/london_mdt' do
   erb :chat_rooms
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
