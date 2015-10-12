require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'LE34567890'
    password_confirmation 'LE34567890'
    username 'galapago'
    description 'The best of the best'
    phone_number Faker::Number.number(10)
    gender 'Male'
  end

  factory :bot do
    name 'Mary'
    gender 'Female'
    eye_color 'Green'
    hair_color 'Black'
    age 26
    association  :user
  end
end
