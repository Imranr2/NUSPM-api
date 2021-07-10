module Api
  module V1
    class SwapsController < ApplicationController
      before_action :authenticate_request
      before_action :set_swap, only: [:show, :update, :destroy]
      # before_action :check_user, only: [:update, :destroy]

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
        @swaps = Swap.where("? = ANY(desired_slots)", params[:desired_slots]).where(module_code: params[:module_code], slot_type:params[:slot_type])
        render json: SwapsRepresenter.new(@swaps).as_json
      end

      # POST /swaps
      def create
        @swap = current_user.swaps.new(swap_params)

        if @swap.save
          Notification.create!(content: "You have created a new swap #{@swap.module_code} #{@swap.slot_type} [#{@swap.current_slot}]", notifiable:@swap, user_id:current_user.id)
          render json: SwapRepresenter.new(@swap).as_json, status: :created
        else
          render json: @swap.errors.full_messages, status: :unprocessable_entity
        end
      end

      def showSwap
        @swaps = Swap.where(id: JSON.parse(params[:ids]))

        if @swaps
          render json: SwapsRepresenter.new(@swaps).as_json, status: :ok
        else
          render json: {message: "Fucked"}, status: :bad_request
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
          Notification.create!(content: "You have deleted the swap request for #{@swap.module_code} #{@swap.slot_type}", notifiable: @swap, user_id:current_user.id)
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
          params.require(:swap).permit(:module_code, :slot_type, :current_slot, :completed, :startTime, :endTime, :venue, :day, :desired_slots => [])
        end

        # def check_user
        #   if current_user.id != @swap.user.id
        #     render json: {message: "Unauthorized",
        #       user: current_user,
        #       swap: @swap.user.id}, status: :unauthorized
        #   else
        #   end
        # end
    end
  end
end
