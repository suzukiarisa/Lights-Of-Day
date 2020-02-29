class Admins::FestivalsController < ApplicationController
  def index
    @hokkaido_festivals = Festival.where(prefecture_id: 0)
    @tohoku_festivals = Festival.where(prefecture_id: [1, 2, 3, 4, 5, 6])
    @kanto_festivals = Festival.where(prefecture_id: [7, 8, 9, 10, 11, 12, 13])
    @chubu_festivals = Festival.where(prefecture_id: [14, 15, 16, 17, 18, 19, 20, 21, 22, 23])
    @kinki_festivals = Festival.where(prefecture_id: [24, 25, 26, 27, 28, 29])
    @chugoku_festivals = Festival.where(prefecture_id: [30, 31, 32, 33, 34])
    @shikoku_festivals = Festival.where(prefecture_id: [35, 36, 37, 38])
    @kyushu_festivals = Festival.where(prefecture_id: [39, 40, 41, 42, 43, 44, 45])
    @okinawa_festivals = Festival.where(prefecture_id: 46)
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
      @festival = Festival.new(festival_params)
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
    params.require(:festival).permit(:image, :event_date, :prefecture_id, :body, :festival_name_id, :place_id)
  end
end
