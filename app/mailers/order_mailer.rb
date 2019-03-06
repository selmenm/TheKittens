class OrderMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def confirm_cart(order)
    @cart = Cart.all.where(order_id: order.id)
    @user = User.all.find(@cart.user_id.first)
    mail(to:@user.email, subject: 'Félicitations !') 
  end

  def admin_confirm(order)
    @cart = Cart.all.where(order_id: order.id)
    @user = User.all.find(@cart.user_id.first)
    @admin = User.all.where(is_admin: true).first
    mail(to:@admin.email, subject: "Vente n°#{@order.id} par #{@user.pseudo}") 
  end

end