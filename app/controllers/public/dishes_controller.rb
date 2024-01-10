class Public::DishesController < ApplicationController
  def index
    @dishes = Dish.page(params[:page]).per(6)
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
