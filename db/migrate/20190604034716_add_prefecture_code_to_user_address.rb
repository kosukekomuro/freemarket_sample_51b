class AddPrefectureCodeToUserAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :prefecture_code, :integer
  end
end
