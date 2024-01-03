class Admin::DishesController < ApplicationController
  def index
    @dishes = Dish.page(params[:page]).per(6)
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @dish = Dish.new
    @genres = GenreDish.all
  end

  def create
    @dish = Dish.new(dish_params)
    @genres = GenreDish.all
    if @dish.save
      redirect_to admin_dish_path(@dish), notice: "作成を完了しました"
    else
      puts @dish.errors.full_messages
      render :new
    end
  end

  def edit
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :introduction, :image, :genre_id,:is_active)
  end
end
