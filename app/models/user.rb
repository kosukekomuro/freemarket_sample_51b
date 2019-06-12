class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_secure_password
  has_one :user_detail
  has_one :user_address
  accepts_nested_attributes_for :user_detail, :user_address
  has_many :likes
  has_many :products, through: :likes

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
  validates :password, presence: true, confirmation: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
end