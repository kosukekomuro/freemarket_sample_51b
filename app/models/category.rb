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

  # 最下層のカテゴリーidを配列で返却する
  def self.search_category_family_ids(parent_id)

    # カテゴリ-のparent_id == 0の場合、からの配列を返却
    if parent_id.to_i == 0
      return category = []
    end

    category_parent = Category.find(parent_id)
    # 最下層のカテゴリーかどうかチェック
    #子供と、孫が存在しない場合(孫カテゴリーの場合)
    if category_parent.indirect_ids.length == 0 &&
       category_parent.child_ids.length == 0

       category_ids = [parent_id]
       return category_ids
    end
    #子供が存在し、孫が存在しない場合（子カテゴリーの場合）
    if category_parent.indirect_ids.length == 0 &&
       category_parent.child_ids.length > 0

       return category_parent.child_ids
    end
    #子供と孫が存在する場合（親カテゴリーの場合）
    if category_parent.indirect_ids.length > 0 &&
       category_parent.child_ids.length > 0

       return category_parent.indirect_ids
    end
  end
end
