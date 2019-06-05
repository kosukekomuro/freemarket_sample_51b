class User < ApplicationRecord
  has_secure_password
  has_one :user_detail
  has_one :user_address
  accepts_nested_attributes_for :user_detail, :user_address

end
