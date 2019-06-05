class AddPrefectureCodeToUserAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :prefecture_id, :integer, null: false
  end
end
