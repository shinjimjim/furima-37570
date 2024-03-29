class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one :buy

  has_many_attached :images

  validates :images, :name, :content, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :category_id, :condition_id, :burden_id, :prefecture_id, :delivery_day_id,
            numericality: { other_than: 1, message: "を入力して下さい" }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "を入力して下さい" }
  end
end
