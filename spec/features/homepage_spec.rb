require 'rails_helper'

feature "Homepages", :type => :feature do

  context 'a visitor on the homepage' do

    before do
      visit '/'
    end

    xit 'should see the most recent photos posted'

    it 'should see a welcome banner' do
      expect(page).to have_content("Welcome to Railstagram!")
    end

    it 'should see sign up and sign in links' do
      expect(page).to have_link("Sign up")
      expect(page).to have_link("Log in")
    end

  end

  context 'signing in users' do

    before(:each) do
      visit '/'
    end

    it 'clicking the sign up link should take a user to the sign up page' do
      click_link("Sign up")
      expect(page).to have_content("Sign up")
    end

    it 'clicking the sign in link should take a user to the sign in page' do
      click_link("Log in")
      expect(page).to have_content("Log in")
    end

    it 'once a user signs in they should see "Welcome back, name"' do
      click_link("Sign up")
      fill_in("Username", :with => "henryaj")
      fill_in("Email", :with => "test@example.com")
      fill_in("Password", :with => "12345678")
      fill_in("Password confirmation", :with => "12345678")
      click_button("Sign up")
      expect(page).to have_content("You have signed up successfully")
    end

    it 'if a user is signed in, they should see a sign out link and not log in or sign up links' do
      click_link("Sign up")
      fill_in("Username", :with => "henryaj")
      fill_in("Email", :with => "test@example.com")
      fill_in("Password", :with => "12345678")
      fill_in("Password confirmation", :with => "12345678")
      click_button("Sign up")
      expect(page).to have_content("Sign out")
      expect(page).not_to have_content("Sign up")
      expect(page).not_to have_content("Log in")
    end

  end

end
