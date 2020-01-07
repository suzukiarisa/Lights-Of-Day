class RecommendsController < ApplicationController

 def new
     @recommend = Recommend.new
     @recommend.recommend_photos.build
     @user_id = current_user.id
  end

  def index
    @recommends = Recommend.all
    @recommends = Recommend.page(params[:page]).per(12)
  end

  def create
    @recommend = Recommend.new(recommend_params)
    respond_to do |format|
      if @recommend.save
        if params[:recommend_images]
          params[:recommend_images][:images].each do |image|
            @recommend.recommend_photos.create(image: image, recommend_id: @recommend.id)
          end
              rc = Vision.get_image_data(@recommend.recommend_photos[0].image)
              p rc
           if rc["adult"] == "VERY_LIKELY" || rc["adult"] == "LIKELY" || 
            rc["violence"] == 'VERY_LIKELY' || rc["violence"] == 'LIKELY' || 
            rc["medical"] == 'VERY_LIKELY' || rc["medical"] == 'LIKELY'
             @recommend.destroy
              flash[:error] = "不適切な画像と判断されました"
              redirect_to new_recommend_path
              return
           end
        end

        format.html{redirect_to recommends_path}
      else
        @recommend.recommend_photos.build
        format.html{render action: 'new'}
      end
    end
  end

  def edit
     @recommend = Recommend.find(params[:id])
  end

  private

  def recommend_params
    params.require(:recommend).permit(:spot, :body, :post_date, :user_id, :recommmend_photo_id, :title)
  end

def product_parameter
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :prefecture_id, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
