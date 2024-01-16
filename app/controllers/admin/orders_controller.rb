class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page])
    
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status += 1
    if @order.update(order_params)
      if @order.status == "製作中"
        order_making_time = OrderMakingTime.new
        order_making_time.order_id = @order.id
        order_making_time.start_at = Time.zone.now
        order_making_time.save
      elsif @order.status == "配送中"
        @order.order_making_time.shipping_start_at = Time.zone.now
        @order.order_making_time.save
      elsif @order.status == "配送済"
        @order.order_making_time.shipping_end_at = Time.zone.now
        @order.order_making_time.save
      end
      redirect_to admin_order_path(@order), notice: "変更を完了しました"
    else
      render admin_order_path(@order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def order_making_time_params
    params.require(:order_making_time).permit(:orer_id, :start_at, :end_at, :shipping_start_at, :shipping_end_at)
  end


end
