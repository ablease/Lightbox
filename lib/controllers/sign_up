class Lightbox < Sinatra::Base
  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    verify_gmc(params[:gmc_number], params[:name])
    create_user
    sign_up_successful?
    flash[:notice] = "Your password doesn't match, please try again"
    redirect '/sign_up'
  end
end
