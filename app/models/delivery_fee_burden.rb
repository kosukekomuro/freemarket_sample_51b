class DeliveryFeeBurden < ApplicationRecord
    has_many :products
    belongs_to :delivery_method
end
