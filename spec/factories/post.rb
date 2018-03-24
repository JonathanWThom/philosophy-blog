FactoryBot.define do
  factory :post do
    title { Faker::Beer.unique.name }
    body { Faker::Beer.unique.style }
    book
    user
  end
end
