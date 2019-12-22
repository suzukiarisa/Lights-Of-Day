class Admins::FestivalsController < ApplicationController
  def index
    if admin_signed_in?
    @search = Festival.includes(:festival_name,:place).ransack(params[:q])
    @festival_result = @search.result.page(params[:page]).per(20)
  else
    redirect_to root_path
  end
  end

  def edit
    if admin_signed_in?
    @festival = Festival.find(params[:id])
  else
    redirect_to root_path
  end
  end

  def new
    if admin_signed_in?
    @festival = Festival.new
  else
    redirect_to root_path
  end

  end

  def autocomplete_festival_name
    festival_name_suggestions = FestivalName.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json{
        render json: festival_name_suggestions
      }
    end
  end

  def autocomplete_place
    place_suggestions = Place.autocomplete(params[:term]).pluck(:name)
    respond_to do |format|
      format.html
      format.json{
        render json: place_suggestions
      }
    end
  end

  def create
    @festival_name = FestivalName.find_by(name: params[:festival][:festival_name_id])
    @place = Place.find_by(name: params[:festival][:place_id])

    @festival = Festival.new(festival_params)
    @festival.festival_name_id = @festival_name.id
    @festival.place_id = @place.id
    if @festival.save
      redirect_to new_admins_festival_path
    else
      render 'new'
  end
  end

  def update
    @festival_name = FestivalName.find_by(name: params[:festival][:festival_name_id])
    @place = Place.find_by(name: params[:festival][:place_id])

    @festival = Festival.find(params[:id])
    @festival.festival_name_id = @festival_name.id
    @festival.place_id = @place.id
    if @festival.update(festival_params)
      redirect_to admin_festival_path(params[:id])
    else
      render 'edit'
  end
  end

  def destroy
    @festival = Festival.find(params[:id])
    @festival.destroy
    redirect_to admin_festivals_path
  end


  private
  #cocoon用記述。_destroyがないと削除できない。
  def festival_params
    params.require(:festival).permit(:image, :event_date, :prefecture_id, :body, :fastival_name_id, :place_id)
  end
end
