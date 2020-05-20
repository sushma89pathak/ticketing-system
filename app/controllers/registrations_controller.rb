class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    root_path if current_user
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :name, :gender)
  end
end



