require 'rest_client'
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

  def generate_referral_token
    (1..64).map{('A'..'Z').to_a.sample}.join
  end

  def send_email(email, token)
    RestClient.post "https://api:key-9eca5824d0f54d46266d9dfeb262ca8d"\
    "@api.mailgun.net/v2/app077aebbd49114d208e9fcdbafd335c45.mailgun.org/messages",
      :from => 'Mailgun Sandbox <postmaster@app077aebbd49114d208e9fcdbafd335c45.mailgun.org>',
      :to => email,
      :subject => 'Referral for Lightbox',
      :text => ('https://makers-lightbox.herokuapp.com/referral/' + token)
  end
end
