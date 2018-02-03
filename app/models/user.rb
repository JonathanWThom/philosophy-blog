class User < ApplicationRecord
  has_many :posts
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  validates :email, :name, :password, presence: true
end
