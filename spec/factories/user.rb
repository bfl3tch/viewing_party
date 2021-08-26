FactoryBot.define do
  factory :user do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password = "123456"
    password_confirmation =  "123456"
  end
end
