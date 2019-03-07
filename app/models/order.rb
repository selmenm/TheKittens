class Order < ApplicationRecord
	has_many :carts

	after_create :confirmation
	def confirmation
		OrderMailer.mail.test
		OrderMailer.confirm_cart(self).deliver_now
		OrderMailer.admin_confirm(self).deliver_now
	end
end


# after_create :confirmation

# def confirmation
# 	OrderMail.test(self).deliver_now
# 	#OrderMail.confirm_cart(self).deliver_now
# 	#OrderMail.admin_confirm(self).deliver_now
# end