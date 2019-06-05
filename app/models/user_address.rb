class UserAddress < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code
  # belongs_to :prefecture
  belongs_to :user, optional: true
end
