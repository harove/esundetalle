class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_one_attached :image
end
