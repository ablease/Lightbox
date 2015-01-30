class Lightbox < Sinatra::Base

  get '/pub_keys' do
    user_json= []
    User.each do |user_add|
      user_to_add = { email: user_add.email, rsakeypub: user_add.rsakeypub }
      user_json << user_to_add
    end
    user_json.to_json
  end
end
