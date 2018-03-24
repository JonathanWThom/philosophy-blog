FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    author { Faker::Book.unique.author }
    description { Faker::BackToTheFuture.unique.quote }
    image_link "https://example.com/image.jpg"
  end
end
