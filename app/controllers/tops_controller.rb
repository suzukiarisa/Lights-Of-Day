class TopsController < ApplicationController

  def index
    @memories = Memory.all
    @recommends = Recommend.all
  end

  def memory_params
  	params.require(:memory).permit(:spot, :body, :post_date, :user_id, :image)
  end

  def recommend_params
  	params.require(:recommend).permit(:spot, :body, :post_date, :user_id, :image)
  end
end
