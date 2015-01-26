def sign_up(email='Test@test.com', password='test', password_confirmation="test")
  visit '/sign_up'
  expect(page.status_code).to eq 200
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
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
  click_button 'Delete #{title}'
end
