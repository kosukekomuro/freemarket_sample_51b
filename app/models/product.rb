class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :condition
  belongs_to :delivery_method
  belongs_to :delivery_day
  belongs_to :trading_evaluation
  has_many :images, dependent: :destroy, inverse_of: :product
  has_many :likes
  has_many :users, through: :likes

  scope :users, -> (seller_id, product_id){ where('(seller_id = ?) AND (id != ?)', seller_id, product_id).limit(6) }
  scope :brands, -> (brand_id, category_id, product_id){ where('(brand_id = ?) AND (category_id = ?) AND (id != ?)', brand_id, category_id, product_id).limit(6) }
  scope :previous, -> (product_id){ where('(id < ?)', product_id).order("id DESC").first }
  scope :next, -> (product_id){ where('(id > ?)', product_id).order("id ASC").first }
end
