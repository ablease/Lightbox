require 'byebug'

def verify_gmc(gmc_numb, doc_name)
  Capybara.default_wait_time = 5
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js: true, js_errors: false)
  end

  driver = Capybara.default_driver = :poltergeist

  visit "http://webcache.gmc-uk.org/gmclrmp_enu/start.swe?SWECmd=GotoView&_sn=UuqH.TiYFCC8fTutgaIFOnn0qt1zNkJyrWjMxDKkbF44Bgy0mr49wdg8aloDHHv4xSLFhgZQZRwOQHhO65aPaVs0jpU41ogeMwMSTbD8ykxvtgMZFu8Vc6ku1a.HKIXv5p8sNGzV8UgnYVtlfsKwYxoQ1hwb7jCnaq0w6T3gR3dcKEt-udY191T1KYGZw9eZOZSjqgkRhkA_&SWEView=GMC+WEB+Doctor+Search&SRN=&SWEHo=webcache.gmc-uk.org&SWETS=1422375165&SWEApplet=GMC+WEB+Health+Provider+Search+Applet"
  sleep 2.0
  
  byebug
  within_frame('_sweclient'){
    within_frame('_sweview'){
      fill_in 'gmcrefnumber', :with => gmc_numb
      click_link 's_3_1_7_0'
    }
  }
  
  if page.has_text?('Results')
    p "Results exist"
  end

  if (page.has_content?(doc_name) && page.has_content?(gmc_numb))
    @new_user = User.create(name: params["name"],
                            email: params["email"],
                            password: params["password"],
                            password_confirmation: params["password_confirmation"],
                            gmc_number: params["gmc_number"])
  	@new_user.save
    session[:user_id] = @new_user.id
    flash[:notice] = "Successfully signed up"
    redirect '/'
  else
    flash[:notice] = "Your password doesn't match, please try again"
    redirect '/sign_up'
  end

  if page.has_content?('Sorry but we cannot find a record that matches your search.')
    return "No match"
  end

end

