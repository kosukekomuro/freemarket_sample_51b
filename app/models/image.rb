class Image < ApplicationRecord
  belongs_to :product, inverse_of: :images
  validates :product_id, presence: true
  mount_uploader :url, ImageUploader
end
