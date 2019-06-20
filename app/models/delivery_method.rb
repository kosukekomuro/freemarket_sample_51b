class DeliveryMethod < ApplicationRecord
  has_many :products
  has_ancestry

  def self.search_delivery_method_family_ids(parent_ids)
    delivery_method = []

    if !parent_ids.present? || parent_ids[0] == "0"
      return delivery_method
    end

    delivery_method_parent = DeliveryMethod.find(parent_ids)

    # 複数の親レコードがある場合
    if delivery_method_parent.instance_of?(Array)
      delivery_method_parent.each do |parent|
        delivery_method << parent.child_ids
      end

      return delivery_method
    end

    delivery_method << delivery_method_parent.child_ids

    return delivery_method
  end
end
