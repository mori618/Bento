class Public::BentoBoxController < ApplicationController
  def index
    @bentoes = BentoBox.where(is_active: "true").page(params[:page]).per(8)
  end

  def show
    @bento = BentoBox.find(params[:id])
    @carts = Cart
  end
end
