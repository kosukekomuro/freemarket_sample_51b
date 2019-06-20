class CreateSizeEachCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :size_each_categories do |t|
      t.string  :name, null: false, unique: true
      t.timestamps
    end
  end
end
