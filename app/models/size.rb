class Size < ApplicationRecord
  has_many :products
  has_many :category_sizes
  has_many :categories, through: :category_sizes
  has_many :size_each_category_sizes
  has_many :size_each_category, through: :size_each_category_sizes
end
