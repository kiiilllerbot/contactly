class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || dashboard_path
    end

    def after_sign_up_path_for(resource)
        after_sign_in_path_for(resource)
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :password, :current_password])
    end
end
