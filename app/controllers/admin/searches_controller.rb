class Admin::SearchesController < ApplicationController
  def genre_search
    @genre_id = params[:id]
    @bentoes = BentoBox.where(genre_id: @genre_id).page(params[:page]).per(6)
    @genres = Genre.all
  end
  def genre_dish_search
    @genre_dish_id = params[:id]
    @dishes = Dish.where(genre_id: @genre_dish_id).page(params[:page]).per(6)
    @genres = GenreDish.all
  end
end
