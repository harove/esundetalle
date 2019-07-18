class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find_or_create_by(user: current_user, product: @product, payed: false, price: @product.price)
    @order.quantity += 1

    if @order.save
      respond_to :js
    #  redirect_to products_path, notice: "El producto ha sido agregado al carro."
    else
    #  redirect_to products_path, alert: "El producto NO ha sido agregado al carro"
    end

    @orders = Order.all

  end

  def clean
    @orders = Order.where(user: current_user, payed: false)
    @orders.destroy_all
    redirect_to orders_path, notice: 'El carro se ha vaciado.'
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
  end


  def index
    @orders = current_user.orders.where(payed: false)
    @total = @orders.pluck("price * quantity").sum()
  end
end