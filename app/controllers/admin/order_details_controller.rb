class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.find(params[:detail_id])

    # 注文が製造待ちで、注文商品ボタンが押された時の処理
    # 製造待ちのステータスが製造中になる
    if @order.status == "waiting_production"
      @order.status = "in_production"
      order_making_time = OrderMakingTime.new
      order_making_time.order_id = @order.id
      # 注文の製造開始時間を記録する
      order_making_time.start_at = Time.zone.now
      @order.order_making_time = order_making_time
      order_making_time.save
      @order.save
    end


    if @order_detail.making_status == "waiting"
      @order_detail.making_status = "in_progress"
      order_detail_making_time = OrderDetailMakingTime.new
      order_detail_making_time.order_detail_id = @order_detail.id
      order_detail_making_time.start_at = Time.zone.now
      @order_detail.order_detail_making_time = order_detail_making_time
      order_detail_making_time.save
      @order_detail.save
      redirect_to admin_order_path(@order), notice: "変更を完了しました"
    elsif @order_detail.making_status == "in_progress"
      @order_detail.making_status = "completed"
      @order_detail.order_detail_making_time.end_at = Time.zone.now
      @order_detail.save
      @order_detail.order_detail_making_time.save
      redirect_to admin_order_path(@order), notice: "変更を完了しました"
    else
      redirect_to admin_order_path(@order), notice: "製作ステータスが無効です"
    end

    if @order.order_details.all? { |detail| detail.making_status == "completed" }
        @order.update(status: 2)
        @order.order_making_time.end_at = Time.zone.now
        @order.order_making_time.save
    end

  end

  private

  def order_making_time_params
    params.require(:order_making_time).permit(:orer_detail_id, :start_at, :end_at)
  end

  def order_detail_making_time_params
    params.require(:order_detail_making_time).permit(:start_at, :end_at)
  end

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end

