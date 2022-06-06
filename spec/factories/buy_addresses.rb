FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    house_number { '青山1-1' }
    building_name { '東京ハイツ' }
    telephone_number { Faker::Number.leading_zero_number(digits: 11) }
    user_id { 1 }
    item_id { 1 }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
