class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address" }
  validates :password_digest, presence: true

  has_secure_password

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
end
