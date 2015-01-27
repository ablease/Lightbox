require "selenium-webdriver"
require "capybara"
require "capybara/poltergeist"

include Capybara::DSL

class Lightbox < Sinatra::Base

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    verify_gmc(params[:gmc_number], params[:name])
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

  def verify_gmc(gmc_numb, doc_name)

    gmc_number_search = gmc_numb

#    driver = Selenium::WebDriver.for :remote, :url => "http://webcache.gmc-uk.org/gmclrmp_enu/start.swe", :desired_capabilities => :htmlunit
    Capybara.default_wait_time = 5
    Capybara.register_driver :poltergeist do |app|
      Capybara::Poltergeist::Driver.new(app, js_errors: false)
    end

    driver = Capybara.default_driver = :poltergeist

    visit "http://webcache.gmc-uk.org/gmclrmp_enu/start.swe"
    
    within_frame('_sweclient'){
      within_frame('_sweview'){
        fill_in 'gmcrefnumber', :with => gmc_number_search
        click_link 's_3_1_7_0'
      }
    }
    p page
    if page.has_content?('Sorry but we cannot find a record that matches your search.')
      flash[:notice] = "Your GMC number is wrong"
      redirect '/sign_up' and return 
    end

    if page.has_content?(doc_name) && page.has_content?(gmc_numb)
      flash[:notice] = "You have been signed up successfully"
      redirect to '/'
    end

#     if driver.title == "List of Registered Medical Practitioners | Search Results"
#       flash[:notice] = "Your GMC number is wrong"
#       redirect '/sign_up'
#     end

#     if page.has_text?(doc_name)
#     first_name =  page.find('s_3_2_41_2')
#     second_name = page.find('s_3_2_40_2')

#     puts first_name.text + ' ' + second_name.text

#     unless first_name.text + ' ' + second_name.text == doc_name
#       flash[:notice] = "Your name doesn't match your GMC-Number, please try again"
#       redirect '/sign_up'
#     else
#       puts 'success'
#     end
#    driver = Selenium::WebDriver.for :firefox
#    wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds

#    driver.navigate.to "http://webcache.gmc-uk.org/gmclrmp_enu/start.swe"

#    driver.switch_to.frame "_sweclient"

#    driver.switch_to.frame "_sweview"

#    element = driver.find_element(:id, "gmcrefnumber")
#    element.send_keys gmc_number_search
#    driver.find_element(:id, "s_3_1_7_0").click

#    wait.until{ driver.title == "List of Registered Medical Practitioners | Doctor Details" || "List of Registered Medical Practitioners | Search Results"}

#    if driver.title == "List of Registered Medical Practitioners | Search Results"
#      flash[:notice] = "Your GMC number is wrong"
#      redirect '/sign_up'
#    end


#    first_name = driver.find_element(:id => "s_2_1_29_0")
#    second_name = driver.find_element(:id => "s_2_1_28_0")

#    puts first_name.text + ' ' + second_name.text

#    unless first_name.text + ' ' + second_name.text == doc_name
#      flash[:notice] = "Your name doesn't match your GMC-Number, please try again"
#      redirect '/sign_up'
#    else
#      puts 'success'
#    end

#    driver.quit

  end

end
