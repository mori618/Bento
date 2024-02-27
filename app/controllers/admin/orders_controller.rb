class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
#注文履歴管理
  def index
    @orders = Order.all.page(params[:page]).order(id: "DESC")

  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.status == "waiting_delivery"
      #ステータスを配送中に変える
      @order.status = "delivering"
      @order.order_making_time.shipping_start_at = Time.zone.now
      @order.order_making_time.save
      @order.save
      redirect_to admin_order_path(@order), notice: "変更を完了しました"
    elsif @order.status == "delivering"
      #ステータスを配送済みに変更する
      @order.status = "delivered"
      @order.order_making_time.shipping_end_at = Time.zone.now
      @order.order_making_time.save
      @order.save
      redirect_to admin_order_path(@order), notice: "変更を完了しました"
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
