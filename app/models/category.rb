class Category < ApplicationRecord
  has_ancestry
  has_many :products
  has_many :sizes, through: :category_sizes
  has_many :category_sizes
end