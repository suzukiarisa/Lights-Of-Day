class MemoriesController < ApplicationController
	def new
	   @memory = Memory.new
	   @memory.memory_photos.build
	   @user_id = current_user.id
	end

  def index
    @memories = Memory.all
  end

  def create
    @memory = Memory.new(memory_params)
    respond_to do |format|
      if @memory.save
        if params[:memory_images]
          params[:memory_images][:images].each do |image|
            @memory.memory_photos.create(image: image, memory_id: @memory.id)
          end
        end
        format.html{redirect_to root_path}
      else
        @memory.memory_photos.build
        format.html{render action: 'new'}
      end
    end
  end

	def edit
	   @memory = Memory.find(params[:id])
	end

	private

	def memory_params
		params.require(:memory).permit(:spot, :body, :post_date, :user_id, :image, :title)
	end

def product_parameter
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :prefecture_id, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
