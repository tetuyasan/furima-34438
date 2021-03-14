FactoryBot.define do
  factory :item do
    item_name { '写真' }
    comment {'これは写真です'}
    category_id { 3 }
    condition_id {3}
    shipping_charge_id {2}
    area_id {5}
    shipping_id {2}
    item_price {1000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
