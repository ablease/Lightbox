require 'spec_helper'
require 'helpers'

feature "Chat" do
  
  scenario "User wants to join the chat for one of their MDTs" do
    sign_up('test@test.com', 'test', 'test', '1111111')
    add_room("London")
    click_link("London")
    visit("/chat_room/London")
    expect(page).to have_content("Chat Room")
  end

  
end
