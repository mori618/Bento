class Admin::BentoController < ApplicationController
  before_action :authenticate_admin!

  def index
    @bentoes = BentoBox.page(params[:page]).per(6)
    @genres = Genre.all
  end

  def show
    @bento = BentoBox.find(params[:id])
  end

  def edit
    @bento = BentoBox.find(params[:id])
    @dishes = Dish.all
    @genres = Genre.all
  end

  def update
    @bento = BentoBox.find(params[:id])
    @dishes = Dish.all
    @genres = Genre.all
    if @bento.update(bento_params)
      redirect_to admin_bento_path(@bento), notice: "変更内容を保存しました"
    else
      render :edit
    end
  end

  def new
    @bento = BentoBox.new
    @dishes = Dish.all
    @genres = Genre.all
  end

  def create
    @bento = BentoBox.new(bento_params)
    @dishes = Dish.all
    @genres = Genre.all
    if @bento.save
      redirect_to admin_bento_path(@bento), notice: "作成を完了しました"
    else
      render :new
    end
  end

  def destroy
    @bento = BentoBox.find(params[:id])
    @bento.destroy
    redirect_to admin_bento_index_path
  end

  def recommend
    BentoBox.update_all(recommended: false)
    bento = BentoBox.find(params[:id])
    bento.update(recommended: true)
    redirect_to admin_bento_path(bento)
  end

  private

  def bento_params
    params.require(:bento_box).permit(:name, :introduction, :image,:price,:genre_id,:is_active,:bento_image,dish_ids:[])
  end

  def dish_params
    params.require(:dish).permit(:name, :introduction, :image, :genre_id,:is_active,:dish_image)
  end
end