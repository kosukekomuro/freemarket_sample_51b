class AddForignkeyToImage < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :images, :products, on_delete: :cascade
  end
end
