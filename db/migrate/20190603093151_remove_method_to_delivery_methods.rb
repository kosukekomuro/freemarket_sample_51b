class RemoveMethodToDeliveryMethods < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_methods, :name, :string
    remove_column :delivery_methods, :method, :string
  end
end
