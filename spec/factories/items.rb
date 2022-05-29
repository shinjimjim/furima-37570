FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name { 'test' }
    content { 'test' }
    category_id { '2' }
    condition_id { '2' }
    burden_id { '2' }
    prefecture_id { '2' }
    delivery_day_id { '2' }
    price { '300' }
    association :user
  end
end
