class RemoveDeliveryFeeBurdenIdToDeliveryMethods < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :delivery_fee_burden_id, :references
    remove_column :delivery_methods, :delivery_fee_burden_id, :references
    add_column :delivery_methods, :ancestry, :string
    add_index :delivery_methods, :ancestry
    end
end
