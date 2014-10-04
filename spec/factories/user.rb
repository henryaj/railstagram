FactoryGirl.define do 

  factory :user do
    factory :user1 do
      email 'test@test.com'
      username 'henry'
      password '12345678'
    end
  end
  
end