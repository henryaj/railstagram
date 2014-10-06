require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'must have a username' do
    user = User.new(:email => "test@test.com", :password => "12345678", :password_confirmation => "12345678")
    expect(user).to have_exactly(1).errors_on(:username)
  end

  it 'must have an email address' do
    user = User.new(:username => "henry", :password => "12345678", :password_confirmation => "12345678")
    expect(user).to have_exactly(1).errors_on(:email)
  end

  it 'must have a valid email address' do
    user = User.new(:username => "henry", :email => "test", :password => "12345678", :password_confirmation => "12345678")
    expect(user).to have_exactly(1).errors_on(:email)
  end

  it 'password confirmation must match the password' do
    user = User.new(:email => "test@test.com", :username => "henry", :password => "12345678", :password_confirmation => "99999999")
    expect(user).to have_exactly(1).errors_on(:password_confirmation)
  end

  it { should have_many(:posts)}
  it { should have_many(:comments)}
  it { should have_many(:hearts)}

  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:email)}

end
