class CreateSizeEachCategorySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :size_each_category_sizes do |t|
      t.references :size_each_category, foreign_key: true
      t.references :size, foreign_key: true
      t.timestamps
    end
  end
end
