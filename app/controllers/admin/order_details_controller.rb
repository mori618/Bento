class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details.find(params[:detail_id])

    if @order_detail.making_status == "製作待ち"
      @order_detail.making_status = "製作中"
      order_detail_making_time = OrderDetailMakingTime.new
      order_detail_making_time.order_detail_id = @order_detail.id
      order_detail_making_time.start_at = Time.zone.now
      order_detail_making_time.save
      redirect_to admin_order_path(@order), notice: "変更を完了しました"
    elsif @order_detail.making_status == "製作中"
      @order_detail.making_status = "製作完了"
      @order_detail.order_detail_making_time.end_at = Time.zone.now
      @order_detail.order_detail_making_time.save
      redirect_to admin_order_path(@order), notice: "変更を完了しました"
    end

    if @order.order_details.all? { |detail| detail.making_status == "製作完了" }
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

