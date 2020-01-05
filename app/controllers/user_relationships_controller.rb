class UserRelationshipsController < ApplicationController

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id],following_id: current_user.id)
    follow.save
    redirect_to users_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to users_path
  end

  private

  def user_relationship_params
    params.require(:user_relationship).permit(:follow_id,:user_id)

  end
end

