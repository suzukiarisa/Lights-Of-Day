class ApplicationController < ActionController::Base

		#deviseで利用出来るパラメーターを設定
		before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def  configure_permitted_parameters
		#devise_parameter_sanitizer.parmit(追加したい処理の引数の値, key: [ﾊﾟﾗﾒｰﾀｰ1,ﾊﾟﾗﾒｰﾀｰ2])
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :prefecture_id, :image, :favorite_artists])
	end

	def after_sign_in_path_for(resource_or_scope)
	 if resource_or_scope.is_a?(Admin)
	   admins_festivals_path
	 else
	   root_path
	 end
    end

	def after_sign_out_path_for(resource)
       homes_about_path
    end
end
