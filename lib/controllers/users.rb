require "json"

class Lightbox < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    verify_gmc(params["gmc_number"], params["name"])

    @new_user = User.create(name: params["name"], 
                            email: params["email"], 
                            password: params["password"], 
                            password_confirmation: params["password_confirmation"],
                            gmc_number: params["gmc_number"])

    if 	@new_user.save
      session[:user_id] = @new_user.id
      flash[:notice] = "Successfully signed up"
      redirect '/'
    else
      flash[:notice] = "Your password doesn't match, please try again"
      redirect '/sign_up'
    end

  end

  def verify_gmc(number, name) 
    json = File.read("api/doctors.json")
    doctors = JSON.parse(json)

    if valid_gmc?(number)
      if check_doctor_name(number, name)  return "Valid GMC number"
      else return "Doctor's name does not match that GMC number" 
      end
      return "Not valid number"
    end 
  end

  def valid_gmc?(number) 
    json = File.read("api/doctors.json")
    doctors = JSON.parse(json)
    if doctors[number] != nil
    end
  end

  def check_doctor_name(number, name)
    if doctors[number][name] == params["name"]
    end
  end



  get '/login' do
    erb :login
  end

  post '/login' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)

    if user
      session[:user_id] = user.id
      flash[:notice] = "Successfully logged in"
      redirect to('/')
    else
      flash[:notice] = ["The email or password are incorrect"]
      redirect to('/login')
    end
  end

  delete '/login' do 
    session.clear
    flash[:notice] = ["Goodbye!"]
    redirect to('/')
  end

  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end

end

