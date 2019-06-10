class ChangeColumnToImage < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :images, :products
  end
end
