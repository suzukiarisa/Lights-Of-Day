class FollowsController < ApplicationController
  def index
  	@follow = Follow.new
    @follow = Follow.where(user_id: current_user.id)
  end
end
