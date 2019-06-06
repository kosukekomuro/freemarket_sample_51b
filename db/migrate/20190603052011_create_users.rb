class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, nil: false
      t.string :email, nil: false, unique:true
      t.string :password_digest, nil: false
      t.text :introduce
      t.string :phone_number
      t.timestamps
    end
  end
end
