class Lightbox < Sinatra::Base

  get '/' do
    @rooms = Room.all
    erb :index
  end

  get '/Referral' do 
    erb :refer
  end
  
  post '/referral' do
    token = generate_referral_token
    send_email(params[:email], token)
    flash[:notice] = "Email sent to: " + params[:email]
    redirect '/'
  end

  get '/referral/:token' do
    flash[:notice] = "You have been successfully referred"
    erb :sign_up
  end

end

