module Api
  module V1    
    class OffersController < ApplicationController
      before_action :authenticate_request
      before_action :set_offer, only: [:show, :update, :destroy]
      # before_action :check_user, only: [:update, :destroy]

      # GET /offers
      def index
        @offers = Offer.where(initiator_user_id: current_user.id).or(Offer.where(creator_user_id: current_user.id))

        render json: OffersRepresenter.new(@offers).as_json
      end

      # GET /offers/1
      def show
        render json: OfferRepresenter.new(@offer).as_json
      end

      # POST /offers
      def create
        # @offer = current_user.initiator_user_offers.new(offer_params)
        @offer = Offer.new(offer_params)

        if @offer.save
          @creatorSwap = Swap.find(offer_params[:creator_swap_id])
          @initiatorSwap = Swap.find(offer_params[:initiator_swap_id])
          
          Notification.create!(content: "You have received a new offer for #{@creatorSwap.module_code} #{@creatorSwap.slot_type}", notifiable:@creatorSwap, user_id:offer_params[:creator_user_id])
          Notification.create!(content: "You have sent an offer for #{@initiatorSwap.module_code} #{@initiatorSwap.slot_type}", notifiable:@initiatorSwap, user_id:offer_params[:initiator_user_id])
          
          render json: OfferRepresenter.new(@offer).as_json, status: :created
        else
          render json: @offer.errors.full_messages, status: :unprocessable_entity
        end
      end
      

      # PATCH/PUT /offers/1
      def update
        # something here if accepted or rejected then create notification
        if @offer.update(offer_params)
          render json: { message: offer_params[:accepted] }, status: :ok
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
        @offers = Offer.where(initiator_swap_id: params[:swap_id])
        @swap = Swap.find(params[:swap_id])
        if @offers
          @offers.destroy_all
          render json: {message: "Offers withdrawn"}, status: :ok
        else
          render json: {message: "Unable to withdraw offer"}, status:bad_request
        end
      end

      def reject
        @offers = Offer.where(creator_swap_id: params[:swap_id])
        @swap = Swap.find(params[:swap_id])

        if @offers
          @offers.destroy_all
          render json: {message: "Rejected offers"}, status: :ok
        else
          render json: {message: "Unable to reject offer"}, status:bad_request
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_offer
          @offer = Offer.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def offer_params
          params.require(:offer).permit(:accepted, :initiator_swap_id, :creator_swap_id, :initiator_user_id, :creator_user_id, :pending)
        end

        # def check_user
        #   if current_user.id != @offer.user.id
        #     render json: {message: "Unauthorized",
        #       user: current_user,
        #       swap: @offer.user.id}, status: :unauthorized
        #   else
        #   end
        # end
    end
  end
end
