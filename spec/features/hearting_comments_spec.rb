require 'rails_helper'

feature "Hearting comments", :type => :feature do

  before do
    visit '/'
    @post = create(:post1)
  end

  it 'a comment should show the number of hearts it has beside it' do
    page.find('a#post1').click
    expect(page).to have_css('#hearts')
  end

end