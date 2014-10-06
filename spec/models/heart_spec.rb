require 'rails_helper'

RSpec.describe Heart, :type => :model do
  it { should belong_to(:user) }
  it { should belong_to(:comment) }
end
