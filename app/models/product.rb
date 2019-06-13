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
      # Todo いいね機能実装後に実装
    end
  end
end
