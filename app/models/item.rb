class Item < ApplicationRecord
	validates :title, :description, :price, :image_url, presence: true

  has_many :carts
  has_many :reviews
  belongs_to :breed
end
