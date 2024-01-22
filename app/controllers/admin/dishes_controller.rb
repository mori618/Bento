class Admin::DishesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @dishes = Dish.page(params[:page]).per(6)
    @genres = GenreDish.all
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
      render :new
    end
  end

  def destroy
    @dish =Dish.find(params[:id])
    @dish.destroy
    redirect_to admin_dishes_path
  end

  def edit
    @dish = Dish.find(params[:id])
    @genres = GenreDish.all
  end

  def update
    @dish = Dish.find(params[:id])
    @genres = GenreDish.all
    if @dish.update(dish_params)
      redirect_to admin_dish_path(@dish), notice: "変更内容を保存しました。"
    else
      render :edit
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :introduction, :image, :genre_id,:is_active,:dish_image)
  end
end
