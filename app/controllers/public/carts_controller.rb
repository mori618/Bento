class Public::CartsController < ApplicationController
  before_action :authenticate_member!, only: [:show]

  def index
    @carts = current_customer.carts.all
    # @cart_item = current_customer.cart_item
    # @item = @cart_item.item
  end

  def update
     @carts = Cart.find(params[:id])
     @carts.update(carts_params)
      redirect_to carts_path, notice: "数量を変更しました"
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    @carts = Cart.all
      redirect_to carts_path
  end

  def destroy_all
    carts = Cart.all
    carts.destroy_all
      redirect_to carts_path
  end

  def create
    @cart = current_customer.carts.new(carts_params)
      if current_customer.carts.find_by(bento_box_id: params[:cart][:bento_box_id]).present?
        cart = current_customer.carts.find_by(bento_box_id: params[:cart][:bento_box_id])
        cart.amount += params[:cart][:amount].to_i
        cart.save
        redirect_to carts_path
      elsif @cart.save
              @carts = current_customer.carts.all
              redirect_to carts_path
      else
              redirect_to root_path
      end
  end

  private

  def carts_params
    params.require(:cart).permit(:customer_id,:bento_box_id,:amount)
  end
end

