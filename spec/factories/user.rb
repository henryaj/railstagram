FactoryGirl.define do 

  factory :user do
    factory :user1 do
      id '1'
      email 'test@test.com'
      username 'henry'
      password '12345678'
    end
  end
  
end