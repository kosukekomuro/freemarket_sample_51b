class DeliveryMethod < ApplicationRecord
    belongs_to :delivery_fee_burden
    has_many :products
end
