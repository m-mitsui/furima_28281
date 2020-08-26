class Product < ApplicationRecord
  belongs_to :consumer
  has_one :buy
  has_one_attached :image

  zenkaku_kanakanji = /\A[ぁ-んァ-ン一-龥]/
   
    with_options presence: true do
        validates :name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
        validates :image
        validates :category
        validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
        validates :explain, format: {with: /\A[ぁ-んァ-ン一-龥]/}
        validates :status
        validates :delivery_fee
        validates :delivery_time
        validates :ship_from
    end
  
end
