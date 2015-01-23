require "selenium-webdriver"


class Lightbox < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @new_user = User.create(name: params["name"],
                            email: params["email"],
                            password: params["password"],
                            password_confirmation: params["password_confirmation"],
                            gmc_number: params["1234567"])
    if 	@new_user.save
      session[:user_id] = @new_user.id
      verify_gmc(params["1234567"])
      flash[:notice] = "Successfully signed up"
      redirect '/'
    else
      flash[:notice] = "Your password doesn't match, please try again"
      redirect '/sign_up'
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

  def verify_gmc(gmc_numb)

    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to "http://webcache.gmc-uk.org/gmclrmp_enu/start.swe"


    # wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

    # frame11= driver.find_element(:name, "_sweclient")

    driver.switch_to.frame "_sweclient"

    driver.switch_to.frame "_sweview"

    # driver.switch_to.frame(driver.find_element(:name, "_sweclient"))


    puts '______________'
    # wait.until { driver.find_element(:id => "gmcrefnumber") }

    element = driver.find_element(:id, "gmcrefnumber")
    element.send_keys "2575276"
    driver.find_element(:id, "s_3_1_7_0").click

    # puts __________________
    # puts element.text







    # ____________________________________________

    # agent = Mechanize.new
    #
    # page  = agent.get 'http://webcache.gmc-uk.org/gmclrmp_enu/start.swe'
    #
    # form            = page.form_with(:action => "/gmclrmp_enu/start.swe")
    # form_text       = form.field_with(:id => 'gmcrefnumber')
    #     puts form_text
    # # form_text.value = '1234567'
    # button          = form.button_with(:value => 'Search')
    #
    # agent.submit(form, form_text, button)
    #
    # puts '======================='
    #
    # puts form.inspect
    #
    # puts '======================='
    #
    # puts page.body

# Sorry but we cannot find a record that matches your search.

  end

end
