class Admins::PlacesController < ApplicationController
  def new
    if admin_signed_in?
  	@place = Place.new
    else
    redirect_to root_path
    end
  end

  def create
  	@place = Place.new(place_params)
  if @place.save
    	redirect_to new_admins_place_path
    else
      render 'new'
  end
  end

  def edit
    if admin_signed_in?
  	@place = Place.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
  	@place = Place.find(params[:id])
  	#update_attributesとは?
  	#Hashを引数に渡してデータベースのレコードを複数同時に更新することができるメソッド
    if @place.update_attributes(place_params)
    	redirect_to edit_admins_place_path
    else
      render 'edit'
  end
end

  	 def destroy
    Place.find(params[:id]).destroy
    flash[:success] = "開催地を削除しました"
      redirect_to new_admins_place_path
  end

  private
  def place_params
  	params.require(:place).permit(:name)
end
end