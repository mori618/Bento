class Public::BentoBoxController < ApplicationController
  def index
    @bentoes = BentoBox.where(is_active: "true").page(params[:page]).per(6)
    @genres = Genre.all
  end

  def show
    @bento = BentoBox.find(params[:id])
    @carts = Cart
  end
end
