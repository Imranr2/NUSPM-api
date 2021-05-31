class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    private

    def index
        render html: '<h1>NUSPM-api</h1>'.html_safe
    end

    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
