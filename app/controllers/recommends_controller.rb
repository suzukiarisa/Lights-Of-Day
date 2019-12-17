class RecommendsController < ApplicationController
 def new
	   @recommend = Recommend.new
	end

	def create
	   article = Article.find(params[:id])
	   @recommend = Recommend.new(recommend_params)
	   @recommend.user_id = current_user.id
	 if @recommend.save
        redirect_to recommends_path
	 else
	   puts @recommend.errors.full_messages
	   render 'new'
	 end
	end

	def edit
	   @recommend = Recommend.find(params[:id])
	end

	private

	def memory_params
		params.require(:recommend).permit(:spot, :body, :post_date, :user_id, :image)
	end
 end