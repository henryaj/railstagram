require 'rails_helper'

feature "Commenting on posts", :type => :feature do 

  before do
      @post = create(:post1)
  end

  it 'when a user clicks on a photo, they should see a modal with a comment box and a submit button' do
    visit '/'
    page.find('#modal1').click
    expect(page).to have_css('input')
    expect(page).to have_css('button')
  end

  it 'when a user clicks on a photo, they should see a modal with a comment box and a submit button' do
    visit '/'
    page.find('#modal1').click
    fill_in('input', with: "great photo")
    click_button("Post comment")
    expect(page).to have_content("great photo")
  end
  
end