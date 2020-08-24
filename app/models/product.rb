class Product < ApplicationRecord
  belongs_to :consumer
  has_one :buy
end
