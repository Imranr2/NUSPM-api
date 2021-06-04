class SwapsRepresenter
    def initialize(swaps)
        @swaps = swaps
    end

    def as_json
        swaps.map do |swap|
            {
                id: swap.id,
                module_code: swap.module_code,
                slot_type: swap.slot_type,
                current_slot: swap.current_slot,
                desired_slots: swap.desired_slots,
                isCompleted: swap.completed,
                isReserved: swap.reserved,
                user_id: swap.user_id
            }
        end
    end

    private
    
    attr_reader :swaps
end