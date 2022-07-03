class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :configure_permitted_parameters, if: :devise_controller?

    # Catch exceptions to display error messages from unauthorized users
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    # Catch exceptions to display error messages from ActiveRecord
    rescue_from ActiveRecord::RecordNotFound, with: :show_404

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || dashboard_path
    end

    def after_sign_up_path_for(resource)
        after_sign_in_path_for(resource)
    end

    private
    # To provide messages for unauthorized access 
    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to action: :index
    end

    def show_404
        render template: "errors/404", status: 404
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :password, :current_password])
    end
end
