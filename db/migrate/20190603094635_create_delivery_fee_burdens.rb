class CreateDeliveryFeeBurdens < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fee_burdens do |t|
      t.string :burden, null: false

      t.timestamps null: false
    end
  end
end
