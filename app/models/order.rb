class Order < ApplicationRecord
	has_many :carts

  after_create :confirm_cart
  def confirm_cart # TO BUILD MAILER + VIEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    OrderMailer.confirm_cart(self).deliver_now
  end
end
