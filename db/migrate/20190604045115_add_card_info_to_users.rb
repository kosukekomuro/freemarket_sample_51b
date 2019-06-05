class AddCardInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :card_id, :string
  end
end
