class OmniauthController < ApplicationController
    skip_before_action :authenticate_user
    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            flash[:notice] = 'Successfully sign in with Google.'
            sign_in_and_redirect @user

        else
            flash[:alert] = 'There was a problem signing you through Google. Please register or try signing later.'
            redirect_to new_user_registration_url
        end
    end

    def failure
        flash[:alert] = 'There was a problem signing you in. Please register or try signing in later.'
        redirect_to new_user_registration_url
    end
end
