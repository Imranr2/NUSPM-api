module Api
  module V1    
    class OffersController < ApplicationController
      before_action :authenticate_request
      before_action :set_offer, only: [:show, :update, :destroy]
      before_action :check_user, only: [:update, :destroy]

      # GET /offers
      def index
        @offers = current_user.offers

        render json: OffersRepresenter.new(@offers).as_json
      end

      # GET /offers/1
      def show
        render json: OfferRepresenter.new(@offer).as_json
      end

      # POST /offers
      def create
        @offer = Offer.new(offer_params)

        if @offer.save
          render json: OfferRepresenter.new(@offer).as_json, status: :created, location: @offer
        else
          render json: @offer.errors.full_messages, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /offers/1
      def update
        if @offer.update(offer_params)
          render json: { message: "Offer updated" }, status: :ok
        else
          render json: @offer.errors.full_messages, status: :unprocessable_entity
        end
      end

      # DELETE /offers/1
      def destroy
        if @offer
          @offer.destroy
          render json: { message: "Offer deleted" }, status: :ok
        else
          render json: { message: "Unable to delete offer" }, status: :bad_request
        end
      end

      def withdraw
        @offers = Offers.where(initiated: true, initiator_swap_id: params[:swap_id])
        if @offers
          @offers.destroy_all
          render json: {message: "Offers withdrawn"}, status: :ok
        else
          render json: {message: "Unable to withdraw offer"}, status:bad_request
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_offer
          @offer = Offer.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def offer_params
          params.require(:offer).permit(:accepted, :initiator_swap_id, :creator_swap_id, :pending, :rejected, :initiated)
        end

        def check_user
          if current_user.id != @swap.user.id
            render json: {message: "Unauthorized",
              user: current_user,
              swap: @swap.user.id}, status: :unauthorized
          else
          end
        end
    end
  end
end
