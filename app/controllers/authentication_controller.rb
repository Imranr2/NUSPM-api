class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
            render json: { auth_token: command.result, user: UserRepresenter.new(User.find_by_email(params[:email])).as_json } 
        else
            render json: { error: command.errors }, status: :unauthorized
        end
    end
end