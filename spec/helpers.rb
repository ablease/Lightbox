def sign_up(name, email, password, password_confirmation, gmc_number)
  visit '/sign_up'
  expect(page.status_code).to eq 200
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :gmc_number, with: gmc_number
  click_button 'Sign Up'
end

def log_in(email, password)
  visit '/login'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log In'
end

def add_room(title)
  within('#new-room') do 
    fill_in 'title', :with => title
    click_button 'Add Room'
  end
end

def delete_room(title) 
  click_button 'Delete'
end
