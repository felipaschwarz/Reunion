FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@glownet.com" }
    sequence(:username) { |n| "username#{n}" }
    sequence(:firstname) { |n| "firstname#{n}" }
    sequence(:lastname) { |n| "lastname#{n}" }
    password "password"
    password_confirmation "password"
  end
end