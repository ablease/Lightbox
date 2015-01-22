require 'spec_helper'
require 'helpers'

feature "Chat" do
  
  scenario "User wants to join the chat for one of their MDTs" do
    sign_up
    log_in("Teast@test.com", "test")
    click_link("London MDT")
    visit("/mdts/london_mdt")
    expect(page).to have_content("You are now chatting in London MDT")
  end
end
