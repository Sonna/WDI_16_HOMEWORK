class User < ActiveRecord::Base
  has_secure_password
  # has_many :comments
  # has_many :dishes

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
