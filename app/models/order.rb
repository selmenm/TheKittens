class Order < ApplicationRecord
	has_many :carts

	after_create :confirmation
	def confirmation
		OrderMailer.confirm_cart(self).deliver_now
		OrderMailer.admin_confirm(self).deliver_now
	end
end