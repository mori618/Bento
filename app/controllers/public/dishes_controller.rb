class Public::DishesController < ApplicationController
  def index
    @dishes = Dish.page(params[:page]).per(8)
    @genres = GenreDish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end
end
