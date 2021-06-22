class OfferRepresenter
    def initialize(offer)
        @offer = offer
    end

    def as_json
        {
            id: offer.id,
            isAccepted: offer.accepted,
            isPending: offer.pending,
            isRejected: offer.rejected,
            initiator_swap_id: offer.initiator_swap_id,
            creator_swap_id: offer.creator_swap_id,
            isInitiated: offer.initiated
        }
    end

    private
    
    attr_reader :offer
end