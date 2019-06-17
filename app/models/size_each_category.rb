class SizeEachCategory < ApplicationRecord
  has_many :sizes, through: :size_each_category_sizes
  has_many :size_each_category_sizes
end
