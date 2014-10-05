require 'rails_helper'

RSpec.describe Post, :type => :model do

  before do
    @post = create(:post1)
  end

  it "has a single user associated with it" do
    expect(@post.username).to eq('henry')
  end

  xit "can have many comments" do
  end
end
