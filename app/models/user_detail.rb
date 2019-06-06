class UserDetail < ApplicationRecord
  belongs_to :user, optional: true

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z]\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
end
