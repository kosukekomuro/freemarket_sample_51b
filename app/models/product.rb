class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :conditon
  belongs_to :delivery_method
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :trading_evaluation
end
