FactoryBot.define do
  factory :user do
    name { Faker::Seinfeld.unique.character }
    email { Faker::Internet.unique.email }
    password "12345678"
  end
end
