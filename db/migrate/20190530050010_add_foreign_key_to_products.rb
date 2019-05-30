class AddForeignKeyToProducts < ActiveRecord::Migration[5.2]
  def change
  end
  add_foreign_key :products, :categories, column: :category_id
  add_foreign_key :products, :sizes, column: :size_id
  add_foreign_key :products, :brands, column: :brand_id
  add_foreign_key :products, :conditions, column: :condition_id
  add_foreign_key :products, :delivery_fee_burdens, column: :delivery_fee_burden_id
  add_foreign_key :products, :delivery_methods, column: :delivery_method_id
  add_foreign_key :products, :prefectures, column: :prefecture_id
  add_foreign_key :products, :delivery_days, column: :delivery_day_id
  add_foreign_key :products, :trading_evaluations, column: :trading_evaluation_id
end
