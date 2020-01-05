class TopsController < ApplicationController

  def index
    @random_memories = Memory.where(id: rand(Memory.first.id..Memory.last.id)).limit(4)
    @random_recommends = Recommend.where(id: rand(Recommend.first.id..Recommend.last.id)).limit(4)
  end

  def memory_params
  	params.require(:memory).permit(:spot, :body, :post_date, :user_id, :image)
  end

  def recommend_params
  	params.require(:recommend).permit(:spot, :body, :post_date, :user_id, :image)
  end
end
