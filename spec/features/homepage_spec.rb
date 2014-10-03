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
      expect(page).to have_link("Sign in")
    end

    it 'clicking the sign up link should take a user to the sign up page' do
      click_link("Sign up")
      expect(page).to have_content("Sign up for Railstagram")
    end

  end

end
