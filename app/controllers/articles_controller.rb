class ArticlesController < ApplicationController

	def index
		@find_friend = FindFriend.all
		@find_friends = []
	      @find_friends.push(@find_friend)


		@memory = Memory.all
		@memories = []
	      @memories.push(@memory)

		@recommend = Recommend.all
		@recommends = []
	      @recommends.push(@recommend)
	end

	 private

	def memory_params
		params.require(:recommend).permit(:spot, :body, :post_date, :user_id, :image)
	end

	def memory_params
		params.require(:recommend).permit(:spot, :body, :post_date, :user_id, :image)
	end
end
