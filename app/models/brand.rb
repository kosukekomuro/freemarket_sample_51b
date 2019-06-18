class Brand < ApplicationRecord
  has_many :products
  scope :search_name, -> (name) do
    if name.present?
      return where("brand = ?", "#{name}")
    else
      return ""
    end
  end
end
