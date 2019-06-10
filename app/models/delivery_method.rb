class DeliveryMethod < ApplicationRecord
  has_many :products
  belongs_to :delivery_fee_burden
end
