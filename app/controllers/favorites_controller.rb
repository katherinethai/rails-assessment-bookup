class FavoritesController < ApplicationController
  def index
    @favorites = []
      Favorite.where(user_id: current_user.id).each do |fav|
        @favorites << fav
      end
     @favorites 
  end

  def new
    @favorite = Favorite.create(
      user_id: params[:user_id],
      book_id: params[:book_id]
      )
    redirect_to favorites_path
  end
end