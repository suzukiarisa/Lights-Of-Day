class UsersController < ApplicationController

	  def index
      @user_relationship = UserRelationship.new
      @users = User.where.not(id: current_user.id)
      @q = User.ransack(params[:q])
      @q.build_condition if @q.conditions.empty?
      @users = @q.result(distinct: true).page(params[:page]).per(20)
      @search = User.ransack(params[:q])
      @users = @search.result.page(params[:page]).per(30)
      @follow_ranks = User.where(:id => UserRelationship.group(:follower_id).
      order("count(*) desc").limit(3).count.keys)
    end

    def index_result
      @q = User.ransack(params[:q])
      @q.build_condition if @q.conditions.empty?
      @users = @q.result(distinct: true).page(params[:page]).per(20)

      @search = User.ransack(params[:q])
      @users = @search.result.page(params[:page]).per(30)
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

    def mypage
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
        flash[:notice] = 'Updated'
        redirect_to user_path
      else
        flash.now[:alert] = 'Update failed'
        render 'edit'
      end
    end

    def follows
      user = User.find(params[:id])
      @users = user.followings
    end

    def followers
      user = User.find(params[:id])
      @users = user.followers
    end

  private
    def user_params
      params.require(:user).permit(:nickname, :prefecture_id, :image, :favorite_artists, :email, :introduction)
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