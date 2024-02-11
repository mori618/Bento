class Admin::GenreDishesController < ApplicationController
  before_action :authenticate_admin!
#弁当カテゴリー管理
  def index
    @genres = GenreDish.page(params[:page])
    @genre = GenreDish.new
  end
  def create
    @genre = GenreDish.new(genre_params)
    if @genre.save
      redirect_to admin_genre_dishes_path, notice: "作成を完了しました"
    else
      redirect_to admin_genre_dishes_path
    end
  end

  def edit
    @genre = GenreDish.find(params[:id])
  end

  def update
    @genre = GenreDish.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genre_dishes_path, notice: "変更を完了しました"
    else
      render edit_admin_genre_dish_path(@genre)
    end
  end

  def destroy
    @genre = GenreDish.find(params[:id])
    @genre.destroy
    redirect_to admin_genre_dishes_path
  end
  private

  def genre_params
    params.require(:genre_dish).permit(:name)
  end
end
