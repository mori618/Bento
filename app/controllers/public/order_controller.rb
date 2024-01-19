class Public::OrderController < ApplicationController
  def index
    @orders = current_customer.orders.page(params[:page]).order(id: "DESC")
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @carts = Cart.where(customer_id: current_customer.id)
    @address_type = params[:order][:address_type]
    case @address_type
    when "customer_address"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      params[:order].delete(:address_type)
    when "registered_address"
      unless params[:order][:registered_address_id] == ""
        address = current_customer.addresses.find(params[:order][:address_id])
        @order.post_code = address.post_code
        @order.address = address.address
        @order.name = address.name
        params[:order].delete(:address_type)
      else
        params[:order].delete(:address_type)
        render :new

      end
    when "new_address"
      params[:order].delete(:address_type)

    else
      params[:order].delete(:address_type)
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @carts = current_customer.carts.all

    @carts.each do |cart|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.bento_box_id = cart.bento_box.id
      @order_detail.price = cart.bento_box.price
      @order_detail.amount = cart.amount
      @order_detail.save
    end

    current_customer.carts.destroy_all
    redirect_to thanks_path
  end

  def thanks
  end


  private

  def order_params
    params.require(:order).permit(:post_code, :address, :name, :shipping_cost, :total_payment, :customer_id, :delivery_time)
  end


end
