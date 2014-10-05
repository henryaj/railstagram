require 'rails_helper'

feature "Homepage", :type => :feature do

  context 'a visitor on the homepage' do

    before do
      @post = create(:post1)
      visit '/'
    end

    it 'should see the most recent photos posted' do
      expect(page).to have_css('img')
    end

    it 'clicking on a photo should bring up a modal' do
      page.find('#modal1').click
      expect(page).to have_css('.modal-dialog')
      expect(page).to have_content('Posted by')
    end

    it 'should see a welcome banner' do
      expect(page).to have_content("Welcome to Railstagram!")
    end

    it 'should see sign up and sign in links' do
      expect(page).to have_link("Sign up")
      expect(page).to have_link("Log in")
    end

  end

  context 'signing in users' do

    before do
      @user = create(:user1)
    end

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
      fill_in("Username", :with => "henryajstankey")
      fill_in("Email", :with => "test@example.com")
      fill_in("Password", :with => "12345678")
      fill_in("Password confirmation", :with => "12345678")
      click_button("Sign up")
      expect(page).to have_content("You have signed up successfully")
    end

    it 'if a user is signed in, they should see a sign out link and not log in or sign up links' do
      login_as @user
      visit '/'
      expect(page).to have_content("Sign out")
      expect(page).not_to have_content("Sign up")
      expect(page).not_to have_content("Log in")
    end

  end

  context 'signing out users' do

    before do
      @user = create(:user1)
    end

    it 'a signed in user should be able to sign out' do
      login_as @user
      visit('/')
      click_link("Sign out")
      expect(page).to have_content("Signed out successfully.")
    end

  end

end
