FactoryBot.define do
  factory :user_product_shipment do
    post_number       { '123-4567' }
    prefecture_id     { 2 }
    city              { '横浜市緑区' }
    number            { '1-1' }
    building          { '森ビル' }
    phone_number      { '09011112222' }
    user_id           { 2 }
    product_id        { 2 }
    token             { 'tok_be425c24e77475954db07004fc51' }
  end
end
