def current_user
  @current_user ||= User.get(session[:user_id])
end

def create_user
  @new_user = User.create!(name: params[:name],
                           email: params[:email],
                           rsakeypub: params[:genratepub_kay],
                           password: params[:password],
                           password_confirmation: params[:password_confirmation],
                           gmc_number: params[:gmc_number])

end

def sign_up_successful?
  if 	@new_user.save
    session[:user_id] = @new_user.id
    flash[:notice] = "Successfully signed up"
    redirect '/'
  end
end

def login_successful?
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    flash[:notice] = "Successfully logged in"
    redirect to('/')
  end
end

def verify_gmc(number, name)
  json = File.read('api/doctors.json')
  doctors = JSON.parse(json)
  if doctors[number] == nil
    flash[:notice] = "That gmc number was not found"
    redirect to('/sign_up')
  end

  if doctors[number]["first_name"] + ' ' + doctors[number]["last_name"] != name
    flash[:notice] = "The name and GMC number you provided do not match"
    redirect to('/sign_up')
  end
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
