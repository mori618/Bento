class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
#弁当カテゴリー管理
  def index
    @genres = Genre.page(params[:page])
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "作成を完了しました"
    else
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre =Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "変更を完了しました"
    else
      render edit_admin_genre_path(@genre)
    end
  end

  def destroy
    @genre =Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end
  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
