class MemoriesController < ApplicationController
	def new
	   @memory = Memory.new
	   @memory.memory_photos.build
	   @user_id = current_user.id
	end

  def index
    @memories = Memory.page(params[:page]).per(12).reverse_order
  end

  def show
    @memory = Memory.find(params[:id])
  end

  def edit
     @memory = Memory.find(params[:id])
     @user = @memory.user
    if current_user != @user
      redirect_to memories_path
    end
  end

  def create
    @memory = Memory.new(memory_params)
    respond_to do |format|
      if @memory.save
        if params[:memory_images]
             rc = Vision.get_image_data(@memory.memory_photos[0].image)
              p rc
           if rc["adult"] == "VERY_LIKELY" || rc["adult"] == "LIKELY" || 
            rc["violence"] == 'VERY_LIKELY' || rc["violence"] == 'LIKELY' || 
            rc["medical"] == 'VERY_LIKELY' || rc["medical"] == 'LIKELY'
             @memory.destroy
              flash[:error] = "不適切な画像と判断されました"
              redirect_to new_memory_path
              return
           end
        end

        format.html{redirect_to memories_path}
      else
        @memory.memory_photos.build
        format.html{render action: 'new'}
      end
    end
  end

  def update
  @memory = Memory.find(params[:id])
  if @memory.update(memory_params)
    redirect_to memories_path(@memory), notice: 'Memory was successfully updated.'
  else
    render :edit
  end
end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to memories_path, notice: 'Memory was successfully destroyed.'
  end

	private

	def memory_params
		params.require(:memory).permit(:spot, :body, :post_date, :user_id, :memory_photo_id, :title, memory_photos_attributes: [:id, :image, :_destroy])
	end

def product_parameter
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :prefecture_id, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
