class RegistrationsController < Devise::RegistrationsController
  before_action :redirect_unless_admin, only: [:create, :new,:cancel]
  skip_before_action :require_no_authentication
  private

  def redirect_unless_admin
    unless !user_signed_in? or current_user.isAdmin?
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end
  def sign_up_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :isRecruiter,
                                  :company_id)
  end

  def account_update_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password,
                                  :isRecruiter,
                                  :company_id)
  end
end

