FactoryBot.define do
  factory :item do
    item_name               { Faker::Commerce.product_name }
    item_description        { Faker::Lorem.paragraph }
    item_price              { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id                { 10 }
    item_condition_id          { 3 }
    cost_id                    { 3 }
    region_id                  { 3 }
    shipping_day_id            { 3 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
