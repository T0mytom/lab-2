class Users::RegistrationsController < Devise::RegistrationsController
  def sign_up(resource_name, resource)
    super
  end

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
