require 'spec_helper'
require 'helpers'

feature "Chat" do
  
  scenario "User wants to join the chat for one of their MDTs" do
    sign_up
    log_in("Test@test.com", "test")
    add_room("London")
    click_link("London")
    visit("/chat_room/London")
    expect(page).to have_content("Chat Room")
  end
end