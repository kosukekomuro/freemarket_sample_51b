class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :conditon
  belongs_to :delivery_method
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :trading_evaluation
end
