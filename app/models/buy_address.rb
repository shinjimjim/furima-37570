class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :buy_id

  with_options presence: true do
    validates :user_id, :item_id, :city, :house_number, buy_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: ^0[0-9]{9,10}$}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
   buy = Buy.create(user_id: user_id, item_id: item_id)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id) 
  end
end