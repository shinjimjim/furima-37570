class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :house_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効な値です。ハイフン(-)を含めてください。", allow_blank: true}
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "は無効な値です。", allow_blank: true}
    validates :prefecture_id, numericality: {other_than: 1, message: "を入力して下さい"}
    validates :token
  end

  def save
   buy = Buy.create(user_id: user_id, item_id: item_id)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id) 
  end
end