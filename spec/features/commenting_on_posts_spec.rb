require 'rails_helper'

feature "Commenting on posts", :type => :feature, js:true do 

  before do
      @user = create(:user1)
      @post = create(:post1)
  end

  xit 'when a user clicks on a photo, they should see a modal with a comment box and a submit button' do
    visit '/'
    page.find('#modal1').click
    expect(page).to have_css('input')
    expect(page).to have_css('button')
    save_screenshot('/Users/henryaj/Desktop/file.png')
  end

  xit 'when a user clicks on a photo, they should see a modal with a comment box and a submit button' do
    visit '/'
    page.find('#modal1').click
    fill_in('input', with: "great photo")
    click_button("Post comment")
    expect(page).to have_content("great photo")
  end
  
end