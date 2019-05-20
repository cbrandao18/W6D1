# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :user do
    username { |n| Faker::Internet.email }
    password { |p| Faker::Internet.password }
  end
end
