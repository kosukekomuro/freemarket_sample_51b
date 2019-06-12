class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :condition, optional: true
  belongs_to :delivery_method, optional: true
  belongs_to :delivery_day
  belongs_to :trading_evaluation

  has_many :images, dependent: :destroy
  has_many :likes
  has_many :users, through: :likes
end
