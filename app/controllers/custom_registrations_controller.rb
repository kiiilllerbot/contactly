class CustomRegistrationsController < Devise::RegistrationsController
    protected
    def after_update_path_for(resource)
        edit_user_registrations_path
    end
end