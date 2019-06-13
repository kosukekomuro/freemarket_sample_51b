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

  def self.product_sort_condition(condition)
    case condition
    when 1 then
      return "updated_at DESC"
    when 2 then
      return "price ASC"
    when 3 then
      return "price DESC"
    when 4 then
      return "updated_at ASC"
    when 5 then
      return "updated_at DESC"
    when 6 then
      # Todo いいねの数 ソート機能 後に実装
    end
  end
  has_many :likes
  has_many :users, through: :likes

  scope :users, -> (seller_id, product_id){ where('(seller_id = ?) AND (id != ?)', seller_id, product_id).limit(6) }
  scope :brands, -> (brand_id, category_id, product_id){ where('(brand_id = ?) AND (category_id = ?) AND (id != ?)', brand_id, category_id, product_id).limit(6) }
  scope :previous, -> (product_id){ where('(id < ?)', product_id).order("id DESC").first }
  scope :next, -> (product_id){ where('(id > ?)', product_id).order("id ASC").first }
end
