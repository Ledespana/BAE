require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    username 'galapago'
    description 'The best of the best'
    phone_number "1234123123"
    gender 'male'
  end

end
