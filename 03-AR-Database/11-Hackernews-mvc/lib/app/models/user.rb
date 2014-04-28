class User < ActiveRecord::Base
  has_many :posts
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Not an email!"}
end