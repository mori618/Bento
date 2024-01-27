class Public::StarsController < ApplicationController

  def create
    @star = Star.new(address_params)

    if @star.save
    redirect_to order_path, notice: "作成を完了しました"
    else
      redirect_to order_path
    end
  end

  private

  def star_params
    prams.require(:star).permit(:star, customer_id: current_user.id, bento_box_id: params[:bento_box_id])
  end
end
