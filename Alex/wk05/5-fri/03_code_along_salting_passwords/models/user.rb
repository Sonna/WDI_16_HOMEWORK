class User < ActiveRecord::Base
  has_secure_password
  # add a method - password
  # add another method - authentication

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
