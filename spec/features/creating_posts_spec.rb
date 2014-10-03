require 'rails_helper'

feature "Creating posts", :type => :feature do



  context 'a user is signed in' do

    before do
      user = User.create(:email => "test@test.com", :username => "henry", :password => "12345678", :password_confirmation => "12345678")
      visit '/'
      click_link("Log in")
      fill_in("Email", :with => "test@test.com")
      fill_in("Password", :with => "12345678")
      click_button("Log in")
    end
    
    it 'there should be a post image button' do
      visit '/'
      expect(page).to have_content "Post image"
    end

    it 'after following "Post image" should see a form' do
      visit '/'
      click_link 'Post image'
      expect(page).to have_css('form')
    end

  end

  context 'a visitor' do
    
    xit 'tries to create a post' do
    end

  end


end