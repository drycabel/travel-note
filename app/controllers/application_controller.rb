class ApplicationController < ActionController::Base
    before_action :authenticate_user

    def authenticate_user
        return if current_user.present?
        redirect_to new_user_session_path, alert: 'Access denied'
    end
end
