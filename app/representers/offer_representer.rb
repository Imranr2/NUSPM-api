class OfferRepresenter
    def initialize(offer)
        @offer = offer
    end

    def as_json
        {
            id: offer.id,
            isAccepted: offer.accepted,
            isPending: offer.pending,
            initiatorSwapId: offer.initiator_swap_id,
            creatorSwapId: offer.creator_swap_id,
            initiatorUserId: offer.initiator_user_id,
            creatorUserId: offer.creator_user_id
        }
    end

    private
    
    attr_reader :offer
end