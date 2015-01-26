require 'spec_helper'
require 'helpers'

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


