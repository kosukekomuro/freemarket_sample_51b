class UserAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z|\A\d{7}\z/ }
  validates :prefecture_id, presence: true
  validates :municipalitie, presence: true, format: { with: /\A[^!"#$%&'()\*\+\.,\/:;<=>?@\[\\\]^_`{|}~]+\z/ }
  validates :address, presence: true, format: { with: /\A[^!"#$%&'()\*\+\.,\/:;<=>?@\[\\\]^_`{|}~]+\z/ }
  validates :building_name, allow_blank: true, format: { with: /\A[^!"#$%&'\*\+\.,\/:;<=>?@\[\\\]^_`{|}~]+\z/ }
end
