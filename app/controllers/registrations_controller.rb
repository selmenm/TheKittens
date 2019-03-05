class RegistrationsController < Devise::RegistrationsController
	before_action :auth_user, only: [:show, :edit, :update]

	def show
		@user = User.find(current_user.id)
	end

	def update
		new_params = params.require(:user).permit(
			:first_name,
			:last_name,
			:username,
			:avatar,
			:age,
			:email,
			:password,
			:password_confirmation,
			:current_password
		)

		change_password = true
		if params[:user][:password].blank?
			params[:user].delete("password")
			params[:user].delete("password_confirmation") 
			new_params = params.require(:user).permit(
				:first_name,
				:last_name,
				:username,
				:avatar,
				:age,
				:email
			)
			change_password = false
		end
		@user = User.find(current_user.id)
			
		is_valid = false
		if change_password
			is_valid = @user.update_with_password(new_params)
		else
			@user.update_without_password(new_params)
		end
		if is_valid
			set_flash_message :notice, :updated
			sign_in @user, :bypass => true
			redirect_to after_update_path_for(@user)
		else
			render "edit"
		end
	end

	private

	def auth_user
    redirect_to new_user_session_path unless user_signed_in?
  end
end