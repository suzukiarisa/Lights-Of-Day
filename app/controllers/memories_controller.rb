class MemoriesController < ApplicationController
	def new
	   @memory = Memory.new
	end

	def create
	   article = Article.find(params[:id])
	   @memory = Memory.new(memory_params)
	   @memory.user_id = current_user.id
	 if @memory.save
        redirect_to memories_path
	 else
	   puts @memory.errors.full_messages
	   render 'new'
	 end
	end

	def edit
	   @memory = Memory.find(params[:id])
	end

	private

	def memory_params
		params.require(:memory).permit(:spot, :body, :post_date, :user_id, :image)
	end

end
