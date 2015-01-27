require 'spec_helper'
require 'helpers'

feature "User adds a new room" do 
  before(:each) {
    sign_up("test@test.com", "test", "test")
  }
  scenario "when visiting the homepage" do 
    expect(Room.count).to eq(0)
    visit('/')
    add_room("London")
    expect(Room.count).to eq(1)
  end
end

feature "User browses a list of chat rooms" do
  before(:each) {
    sign_up("test@test.com", "test", "test")
    add_room("London")
  }

  scenario "when opening the homepage" do 
    visit "/" 
    expect(page).to have_content("London")
  end

end

feature "User deletes an existing room" do 
  before(:each) {
    sign_up("test@test.com", "test", "test")
    add_room("London")
  }
  scenario "when visiting the homepage" do 
    expect(Room.count).to eq(1)
    visit('/')
    delete_room("London")
    expect(Room.count).to eq(0)
  end
end

