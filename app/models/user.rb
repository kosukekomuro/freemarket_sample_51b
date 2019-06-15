class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :sns_credential
  has_one :user_detail
  has_one :user_address
  accepts_nested_attributes_for :user_detail, :user_address
  has_many :likes
  has_many :products, through: :likes

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }

  has_secure_password validations: false
  validate(on: :update) do |record|
    record.errors.add(:password, :blank) unless record.password_digest.present?
  end
  validates_length_of :password, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED, on: :update
  validates_confirmation_of :password, allow_blank: true, on: :update
end
