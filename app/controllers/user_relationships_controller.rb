class UserRelationshipsController < ApplicationController

  def create
    @following = UserRelationship.new(user_relationship_params)
    if @following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to users_path
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to users_path
    end
  end

  def destroy
    followinget = UserRelationship.new(user_relationship_params)
    @following = UserRelationship.find_by(user_id: followinget.user_id, follow_id: followinget.follow_id)
    if @following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to user_path(@following.follow_id)

    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to user_path(@following.follow_id)
    end
  end

  private

  def user_relationship_params
    params.require(:user_relationship).permit(:follow_id,:user_id)

  end
end

