class ApplicationController < ActionController::API
    before_action :authenticate_request
    skip_before_action :authenticate_request, :only => [:index]
    attr_reader :current_user

    def index
        render html: '<h1>NUSPM-api</h1>'.html_safe
    end

    private

    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        # render json: { error: 'Not Authorized' }, status: 401 unless @current_user
        render json: @current_user.errors.full_messages, status: 401 unless @current_user
    end
end
