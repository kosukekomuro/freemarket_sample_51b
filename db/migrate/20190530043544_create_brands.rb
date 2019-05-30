class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand, null: false

      t.timestamps null: false
    end
  end
end
