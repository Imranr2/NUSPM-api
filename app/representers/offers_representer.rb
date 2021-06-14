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
                isRejected: offer.rejected,
                initiator_swap_id: offer.initiator_swap_id,
                creator_swap_id: offer.creator_swap_id,
            }
        end
    end

    private
    
    attr_reader :offers
end