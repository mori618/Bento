class Public::SearchesController < ApplicationController

  def genre_search
    @genre_id = params[:id]
    @bentoes = BentoBox.where(is_active: true, genre_id: @genre_id).page(params[:page]).per(6)
    @genres = Genre.all
  end

  def genre_dish_search
    @genre_dish_id = params[:id]
    @dishes = Dish.where(genre_id: @genre_dish_id).page(params[:page]).per(6)
    @genres = GenreDish.all
  end

  def recommend_search
    @genre_id = params[:id]
    @bento = BentoBox.find_by(recommended: true)
    @genres = Genre.all
  end

end
