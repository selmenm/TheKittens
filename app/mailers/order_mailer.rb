class OrderMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def confirm_cart(order)
    @cart = Cart.where(order_id: order.id)
    @user = User.find(@cart.first.user_id)
    @url = "thekittens.com"
    mail(to:@user.email, subject: 'Félicitations !') 
  end

  def admin_confirm(order)
    @order = order
    @cart = Cart.all.where(order_id: order.id)
    @user = User.find(@cart.first.user_id)
    @admin = User.all.where(is_admin: true).first
    mail(to:@admin.email, subject: "Vente n°#{@order.id} par #{@user.username} ##{@user.id}") 
  end

end



# def confirm_cart(order) 
#   @order = order
#   @cart = Cart.all.where(order_id: @order.id)
#   @user = User.all.find(@cart.user_id.first)
#   @url = "thekittens.com"
#   mail(to:@user.email, subject: 'Félicitations !') 
# end

# def admin_confirm(order)
#   @order = order
#   @cart = Cart.all.where(order_id: @order.id)
#   @user = User.all.find(@cart.user_id.first)
#   @admin = User.all.where(is_admin: true).first
#   mail(to:@admin.email, subject: "Vente n°#{@order.id} par #{@user.pseudo}") 
# end
