class UsersController < ApplicationController

	def index
    end

    def show
    end

    def edit
      @user = current_user
    end

private
    def user_params
      params.require(:user).permit(:nickname, :prefecture_id, :image_id, :favorite_artists, :email)
    end

    def password_params
      params.require(:user).permit(:password,:password_confirmation)
    end

    def currect_user
	    @user = User.find(params[:id])
	  if @user != current_user
	   redirect_to user_path(current_user.id)
	  end
    end
end
