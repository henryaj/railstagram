require 'rails_helper'

feature "Creating posts", :type => :feature do



  context 'a user is signed in' do

    before(:each) do
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

    xit 'a visitor can fill in the form and submit an image, after which they should see "image posted"' do
      Capybara.current_driver = :selenium
      visit '/'
      click_link("Log in")
      fill_in("Email", :with => "test@test.com")
      fill_in("Password", :with => "12345678")
      click_button("Log in")
      sleep 3
      click_link 'Post image'
      fill_in("Caption", :with => "Beautiful day")

      # this click_on will trigger filepicker.io plugin
      click_on 'Upload'
      # waiting for filepicker.io
      sleep 5
      within_frame 'filepicker_dialog' do
        # attach image to filepicker file input and upload...
        find('#fileUploadInput', visible: false).set("#{Rails.root}/spec/features/image.jpg")
        sleep 5
      end

      click_button("Submit")
      expect(page).to have_content("Photo uploaded.")
    end

  end

  context 'a visitor' do
    
    xit 'tries to create a post' do
    end

  end


end