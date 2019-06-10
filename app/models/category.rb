class Category < ApplicationRecord
  has_ancestry
  has_many :products
  has_many :category_sizes
  has_many :sizes, through: :category_sizes

  # カテゴリーのIDからそのIDを親にもつレコードを配列で返却する
  def self.search_category_children(parent_id)
    category_parent = Category.find(parent_id)
    category_children = category_parent.children
  end

  # カテゴリーレコードidとその子孫のidを配列で返却する
  def self.search_category_family_ids(parent_id)
    category_ids = [parent_id]
    category_parent = Category.find(parent_id)
    category_descendant_ids = category_parent.descendant_ids
    category_ids = category_ids + category_descendant_ids
  end
end
