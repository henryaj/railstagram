require 'rails_helper'

feature "Creating posts", :type => :feature do



  context 'a user is signed in' do

    before do
      @user = create(:user1)
    end
    
    it 'there should be a post image button' do
      login_as @user
      visit '/'
      expect(page).to have_content "Post image"
    end

    it 'after following "Post image" should see a form' do
      login_as @user
      visit '/'
      click_link 'Post image'
      expect(page).to have_css('form')
    end

    xit 'a visitor can fill in the form and submit an image, after which they should see "image posted" and their username on the homepage' do
      Capybara.current_driver = :selenium
      visit '/'
      click_link("Sign up")
      fill_in("Username", :with => "henry")
      fill_in("Email", :with => "test@test.com")
      fill_in("Password", :with => "12345678")
      fill_in("Password confirmation", :with => "12345678")
      click_button("Sign up")
      sleep 2
      click_link("Log in")
      fill_in("Email", :with => "test@test.com")
      fill_in("Password", :with => "12345678")
      click_button("Log in")
      sleep 3
      click_link 'Post image'
      fill_in("Caption", :with => "Beautiful day")
      click_on 'Upload'
      sleep 5
      within_frame 'filepicker_dialog' do
        find('#fileUploadInput', visible: false).set("#{Rails.root}/spec/features/image.jpg")
        sleep 5
      end
      click_button("Submit")
      expect(page).to have_content("Photo uploaded.")
      expect(page).to have_content("Beautiful day")
      expect(page).to have_content("henryaj")
      expect(page).to have_css("img")
    end

  end

  context 'a visitor' do
    
    it 'cannot create a post' do
      visit '/'
      expect(page).not_to have_content("Post image")
      visit '/posts/new'
      expect(page).not_to have_content("Post an image")
      expect(page).to have_content("You need to sign in or sign up before continuing")

    end

  end


end