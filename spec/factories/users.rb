FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    lastname { '山田' }
    firstname { '太郎' }
    lastname_reading { 'ヤマダ' }
    firstname_reading { 'タロウ' }
    birthday { '1930-01-01' }
  end
end
