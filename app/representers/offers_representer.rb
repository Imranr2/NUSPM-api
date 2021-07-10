class OffersRepresenter
    def initialize(offers)
        @offers = offers
    end

    def as_json
        offers.map do |offer|
            {
                id: offer.id,
                isAccepted: offer.accepted,
                isPending: offer.pending,
                initiatorSwapId: offer.initiator_swap_id,
                creatorSwapId: offer.creator_swap_id,
                initiatorUserId: offer.initiator_user_id,
                creatorUserId: offer.creator_user_id,
                creatorSwap: SwapRepresenter.new(offer.creator_swap).as_json,
                initiatorSwap: SwapRepresenter.new(offer.initiator_swap).as_json,
                initiatorEmail: offer.initiator_user.email,
                creatorEmail: offer.creator_user.email
            }
        end 
    end

    private
    
    attr_reader :offers
end