class User < ApplicationRecord
  has_secure_password
  include JpPrefecture
  jp_prefecture :prefecture_code
  has_one :user_detail
  has_one :user_address
  accepts_nested_attributes_for :user_detail, :user_address # update_only: true
  # accepts_nested_attributes_for :user_address

end
