class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true
  belongs_to :category
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  belongs_to :condition
  belongs_to :delivery_method
  belongs_to :delivery_day
  belongs_to :trading_evaluation
  has_many :images, dependent: :destroy, inverse_of: :product

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
  scope :search_name, -> (name){ where('(name LIKE ?)', "%#{name}%") if name.present? }
  scope :search_category, -> (category_ids){where(category_id: category_ids) if category_ids.present? }
  scope :search_brand, -> (brand_id){ where(brand_id: brand_id) if brand_id.present? }
  scope :search_size, -> (size_ids){ where(size_id: size_ids) if size_ids.present? }
  scope :search_price, -> (price_min, price_max) do 
    if price_min.present? && price_max.present?
      return where('(price >= ?) AND (price <= ?)', price_min, price_max)
    end
    if price_min.present?
      return where('(price >= ?)', price_min)
    end
    if price_max.present?
      return where('(price <= ?)', price_max)
    end
  end
  scope :search_condition, -> (condition_ids){ where(condition_id: condition_ids) if condition_ids.present? }
  scope :search_delivery_burden, -> (delivery_burden_ids){ where(delivery_method_id: delivery_burden_ids) if delivery_burden_ids.present? }
  scope :search_salus_status, -> (salus_status) do
    if salus_status.present?

      if salus_status == ["1"]
        return where("buyer_id IS ?",  nil)
      end
      if salus_status == ["2"]
        return where("buyer_id IS NOT ?",  nil)
      end
    end
  end

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000, message: "300以上9,999,999以下で入力してください"}
  validates :name, format: { with: /\A[a-zA-Z0-9]|[ぁ-んァ-ン一-龥]|[ -\~〜（）()]+\z/ }
  validates :description, format: { with: /\A[a-zA-Z0-9]|[ぁ-んァ-ン一-龥]|[ -\~〜（）()]+\z/ }
  validates :brand, format: { with: /\A[a-zA-Z0-9]|[ぁ-んァ-ン一-龥]|[ -\~〜（）()]+\z/ }

end
