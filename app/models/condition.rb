class Condition < ApplicationRecord
  has_many :products

  def self.search_condition_ids(condition_ids)

    if !condition_ids.present? || condition_ids.include?("0")
      return condition_ids = []
    end

    return condition_ids
  end
end
