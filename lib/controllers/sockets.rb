class Lightbox < Sinatra::Base
  register Sinatra::RocketIO
  io = Sinatra::RocketIO
  
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

end