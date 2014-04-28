class Post < ActiveRecord::Base
  belongs_to :user
  validates :name, uniqueness: true
  validates :rating, numericality: {greater_than_or_equal_to: 0 }
end