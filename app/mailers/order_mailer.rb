class OrderMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def confirm_cart(order)
    @user = User.find_by_id(order.user_id)
    @cart = Cart.where(user_id: order.user_id).where(order_id: nil)
    @url = "thekittens.herokuapp.com"
    mail(to:@user.email, subject: 'Congratulations') 
  end

  def admin_confirm(order)
    @user = User.find_by_id(order.user_id)
    @cart = Cart.where(user_id: order.user_id).where(order_id: nil)
    @order = order
    @admin = User.all.where(is_admin: true).first
    mail(to:@admin.email, subject: "Sell n°#{@order.id} by #{@user.username} ##{@user.id}") 
  end

end