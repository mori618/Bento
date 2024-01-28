class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def genre_search
    @genre_id = params[:id]
    @bentoes = BentoBox.where(genre_id: @genre_id).page(params[:page]).per(6)
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end

  def genre_dish_search
    @genre_dish_id = params[:id]
    @dishes = Dish.where(genre_id: @genre_dish_id).page(params[:page]).per(6)
    @genre = GenreDish.find(params[:id])
    @genres = GenreDish.all
  end

  def recommend_search
    @bento = BentoBox.find_by(recommended: true)
    @genres = Genre.all
  end

  def new_search
    @bentoes = BentoBox.order(id: :DESC).page(params[:page]).per(6)
    @genres = Genre.all
  end

  def new_dish_search
    @dishes = Dish.order(id: :DESC).page(params[:page]).per(6)
    @genres = GenreDish.all
  end


end
