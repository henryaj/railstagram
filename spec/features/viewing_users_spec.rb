require 'rails_helper'

feature "Viewing users", :type => :feature do 
  
  context 'on the homepage' do

    before do
      @user = create(:user1)
      @post = create(:post1)
    end

    it "the uploader's username and a link to their profile appears underneath a photo" do
      visit '/'
      expect(page).to have_link('henry')
    end

    it 'when clicking on the uploader username, you should be taken to their user profile page' do
      visit '/'
      first('.well').click_link('henry')
      expect(current_path).to eq("/users/#{@user.id}")
    end

  end

end
