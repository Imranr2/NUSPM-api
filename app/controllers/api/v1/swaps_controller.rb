module Api
  module V1
    class SwapsController < ApplicationController
      before_action :set_swap, only: [:show, :update, :destroy]
      before_action :check_user, only: [:update, :destroy]
      before_action :authenticate_request

      # GET /swaps
      def index
        @swaps = current_user.swaps

        render json: SwapsRepresenter.new(@swaps).as_json
      end

      # GET /swaps/1
      def show
        render json: SwapRepresenter.new(@swap).as_json
      end

      def search
        @swaps = Swap.where("? = ANY(desired_slots)", params[:desired_slots]).where(module_code: params[:module_code], slot_type:params[:slot_type]).where.not(user_id: current_user.id)
        render json: SwapsRepresenter.new(@swaps).as_json
      end

      # POST /swaps
      def create
        @swap = current_user.swaps.new(swap_params)

        if @swap.save
          render json: SwapRepresenter.new(@swap).as_json, status: :created
        else
          render json: @swap.errors.full_messages, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /swaps/1
      def update
          if @swap.update(swap_params)
            render json: { message: "Swap updated" }, status: :ok
          else
            render json: @swap.errors.full_messages, status: :unprocessable_entity
          end
      end

      # DELETE /swaps/1
      def destroy
        if @swap
          @swap.destroy
          render json: { message: "Swap deleted" }, status: :ok
        else
          render json: { message: "Unable to delete swap" }, status: :bad_request
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_swap
          @swap = Swap.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def swap_params
          params.require(:swap).permit(:module_code, :slot_type, :current_slot, :completed, :reserved, :desired_slots => [])
        end

        def check_user
          if current_user != @swap.user.id
            render json: {message: "Unauthorized"}, status: :unauthorized
          else
          end
        end
    end
  end
end
