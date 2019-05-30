class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,	null: false, index: true
      t.text :description, null: false
      t.references :seller, null: false
      t.references :buyer
      t.references :category,	null: false
      t.references :size
      t.references :brand
      t.references :condition, null: false
      t.references :delivery_fee_burden, null: false
      t.references :delivery_method, null: false
      t.references :prefecture, null: false
      t.references :delivery_day, null: false
      t.integer :price, null: false
      t.references :trading_evaluation, null: false
      t.timestamps null: false
    end
  end
end
