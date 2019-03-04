class Review < ApplicationRecord
	belongs_to :user
	belongs_to :item

	validates :title, :content, :rating, presence: true

end
