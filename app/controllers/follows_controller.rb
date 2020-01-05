class FollowsController < ApplicationController
  def index
  	@followings = current_user.followings
  end
end
