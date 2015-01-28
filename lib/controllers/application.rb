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
    erb :index
  end

  def generate_referral_token
    (1..64).map{('A'..'Z').to_a.sample}.join
  end

  def send_email(email, token)
    RestClient.post "https://api:key-d5385bf150371c99a132f08198a3aaf1"\
    "@api.mailgun.net/v2/sandboxee6d21a54cf1407eb2874520384a379b.mailgun.org/messages",
      :from => 'Mailgun Sandbox <postmaster@sandboxee6d21a54cf1407eb2874520384a379b.mailgun.org>',
      :to => email,
      :subject => 'Referral for Lightbox',
      :text => ('http://localhost:5001/referral/' + token)
  end
end
