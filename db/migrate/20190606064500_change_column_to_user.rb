class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nickname, :string
    remove_column :users, :email, :string
    remove_column :users, :password_digest, :string
    add_column :users, :nickname, :string, null: false
    add_column :users, :email, :string, null: false, unique: true
    add_column :users, :password_digest, :string, null: false
  end
end
