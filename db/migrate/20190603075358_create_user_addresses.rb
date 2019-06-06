class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.string :municipalitie, null: false
      t.string :address, null: false
      t.string :building_name
      t.timestamps
    end
  end
end
