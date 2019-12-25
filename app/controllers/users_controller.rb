class UsersController < ApplicationController

	  def index
      @users = User.all
    end

    def post
     @user = User.find(params[:id])
     @memories = @user.memories
     @recommends = @user.recommends
    end

    def show
     @user = User.find(params[:id])
     @user = current_user
    end

    def edit
      @user = User.find(params[:id])
      @user = current_user
    end

  def update
      @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to edit_user_path
    else
      render 'edit'
    end
  end


private
    def user_params
      params.require(:user).permit(:nickname, :prefecture_id, :image, :favorite_artists, :email)
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
