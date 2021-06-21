FactoryBot.define do
  factory :product do
    name               { Faker::Name.initials(number: 10) }
    comment            { Faker::Lorem.sentence }
    price              { 1000 }
    status_id          { 2 }
    category_id        { 2 }
    shipment_cost_id   { 2 }
    prefecture_id      { 2 }
    delivery_time_id   { 2 }
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

