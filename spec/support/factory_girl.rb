require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :issue do
    headline "Flat Tire"
    description "My back tire has a nail in the tire."
  end

end
