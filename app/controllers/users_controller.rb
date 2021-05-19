class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :user, only: [:show, :update, :destroy]

    def index
        @users = User.all

        render json: UsersRepresenter.new(@users).as_json
    end

    def show
        render json: UserRepresenter.new(@user).as_json
    end

    def create
        @user = User.new(user_params)

        if @user.save
            token = AuthenticateUser.call(@user.email, @user.password)
            render json: { message: "Account created",
                            token: token,
                            user: UserRepresenter.new(@user).as_json },
                            status: :created
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        if @user.update(user_params)
            render json: { message: "Account updated" }, status: :ok
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        if @user
            @user.destroy
            render json: { message: "Account deleted" }, status: :ok
        else
            render json: { message: "Unable to delete account" }, status: :bad_request
        end
    end

    private

    def user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:email, :password, :password_confirmation) 
    end
end