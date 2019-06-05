class Prefecture < ApplicationRecord
  has_many :products
  has_many :user_addresses
end
