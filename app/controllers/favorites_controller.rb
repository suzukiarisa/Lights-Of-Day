class FavoritesController < ApplicationController
def index
     @favorites = Favorite.where(user_id: current_user.id)
     @favorites = Favorite.page(params[:page]).per(16)
    end

    def create
    	@festival = Festival.find(params[:festival_id])
      @favorite = current_user.favorites.new(festival_id: @festival.id)
      @favorite.save
    end

    def destroy
      @festival = Festival.find(params[:festival_id])
      @favorite = current_user.favorites.find_by(festival_id: @festival.id)
      @favorite.destroy
   end

   def destroy_all
    @favorites = Favorite.where(id: params[:favorites])
    @favorites.destroy_all
    redirect_to favorites_path
   end

  private
    def favorite_params
      params.require(:favorite).permit(:festival_id, :user_id)
    end
end
