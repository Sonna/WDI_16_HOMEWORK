class Dish < ActiveRecord::Base
  has_many :comments # add extra methods
  belongs_to :user # add extra methods
  has_many :likes # add like method
end
