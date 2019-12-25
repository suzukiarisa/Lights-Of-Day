class Admins::FestivalNamesController < ApplicationController

 def new
    if admin_signed_in?
  	@festival_name = FestivalName.new
    else
    redirect_to root_path
    end
  end

  def create
  	@festival_name = FestivalName.new(festival_name_params)
  if @festival_name.save
    	redirect_to  new_admins_festival_name_path
    else
      render 'new'
  end
  end

  def edit
    if admin_signed_in?
  	 @festival_name = FestivalName.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
  	@festival_name = FestivalName.find(params[:id])
  	#update_attributesとは?
  	#Hashを引数に渡してデータベースのレコードを複数同時に更新することができるメソッド
    if @festival_name.update_attributes(festival_name_params)
    	redirect_to edit_admins_festival_name_path
    else
      render 'edit'
  end
end

  def destroy
    FestivalName.find(params[:id]).destroy
    flash[:success] = "フェス名を削除しました"
      redirect_to new_admins_festival_name_path
  end

  private
  def festival_name_params
  	params.require(:festival_name).permit(:name)
end
end