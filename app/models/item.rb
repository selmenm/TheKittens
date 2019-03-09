class Item < ApplicationRecord
	validates :title, :description, :price, :image_url, presence: true

  has_many :carts
  has_many :wishlists
  has_many :reviews
  belongs_to :breed
  belongs_to :admin, class_name: "User"
end
