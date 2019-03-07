class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.where(user_id: current_user.id).where(order_id: nil)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id])
  end

  # GET /carts/new
  def new
    @cart = Cart.new

  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @user = current_user.id
    @cart = Cart.new(cart_params)
    @cart.user_id  = current_user.id

    respond_to do |format|
      if @cart.save
        format.html { redirect_to root_path, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Cart was successfuuuuuully destroyed.' }
      format.json { head :no_content }
    end
  end

  def payment
    @order = Order.new
    @amount = 0
    @carts = Cart.where(user_id: current_user.id)
    i = 0

    Cart.where(user_id: current_user.id).each do |item_in_cart|
      i +=1
      @amount += Item.find(item_in_cart.item_id).price.to_i * item_in_cart.quantity.to_i
    end

    # En centimes
    @amount *= 100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      #description renvoie a quel nom est cree le compte (details des payments visibles sur stripe directement, notament le nom)
      description: 'Rails Stripe customer',
      currency: 'EUR',
    })

    @order.stripe_id = params[:stripeToken]
    @order.save
    Cart.where(user_id: current_user.id).each do |item_in_cart|
        item_in_cart.update(order_id: @order.id)
    end    

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :root
  end

  def additem
    @cart = Cart.find(params[:id])
    @qty = @cart.quantity + 1
    @cart.update(quantity: @qty)
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Cart was successfuuuuuully saved.' }
      format.json { head :no_content }
    end
  end

  def removeitem

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:item_id)
    end
end
