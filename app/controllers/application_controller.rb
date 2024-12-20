class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        flash[:notice] = "User was successfully Loged in."
        user_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
        flash[:notice] = "User was successfully Loged out."
        root_path
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
    end
  end