class OrderMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def confirm_cart(order)
    @cart = Cart.where(order_id: order.id)
    @user = User.find(@cart.first.user_id) # User.find_by_id(Cart.where(order_id: order.id).first.user_id)
    @url = "thekittens.herokuapp.com"
    mail(to:@user.email, subject: 'Congratulations') 
  end

  def admin_confirm(order)
    @order = order
    @cart = Cart.all.where(order_id: order.id)
    @user = User.find(@cart.first.user_id) # User.find_by_id(Cart.where(order_id: order.id).first.user_id)
    @admin = User.all.where(is_admin: true).first
    mail(to:@admin.email, subject: "Sell n°#{@order.id} by #{@user.username} ##{@user.id}") 
  end

end