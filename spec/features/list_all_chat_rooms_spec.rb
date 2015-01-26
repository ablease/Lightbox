require 'spec_helper'
require 'helpers'

feature "User adds a new room" do 
  scenario "when visiting the homepage" do 
    expect(Room.count).to eq(0)
    visit('/')
    add_room("London MDT", "/chat_room/london_mdt")
    expect(Room.count).to eq(1)
  end
end

feature "User browses a list of chat rooms" do
  before(:each) {
    Room.create(:title => "London MDT",
                :url => "/chat_room/london_mdt")
  }

  scenario "when opening the homepage" do 
    visit "/" 
    expect(page).to have_content()
  end



end


