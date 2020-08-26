class Product < ApplicationRecord
  belongs_to :consumer
  has_one :buy
  has_one_attached :image

     with_options presence: true do
        validates :name
        validates :image
        validates :category
        validates :price
        validates :exhibitor
        validates :status
        validates :delivery_fee
        validates :delivery_time
        validates :ship_from
     end
end
