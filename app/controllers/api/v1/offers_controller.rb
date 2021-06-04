module Api
  module V1    
    class OffersController < ApplicationController
      before_action :set_offer, only: [:show, :update, :destroy]
      before_action :authenticate_request

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

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_offer
          @offer = Offer.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def offer_params
          params.require(:offer).permit(:user_id, :accepted, :initiator_swap_id, :creator_swap_id)
        end
    end
  end
end