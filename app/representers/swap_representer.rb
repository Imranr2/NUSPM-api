class SwapRepresenter
    def initialize(swap)
        @swap = swap
    end

    def as_json
        {
            id: swap.id,
            module_code: swap.module_code,
            slot_type: swap.slot_type,
            current_slot: swap.current_slot,
            desired_slots: swap.desired_slots,
            isCompleted: swap.completed,
            isReserved: swap.reserved,
            user_id: swap.user_id,
            venue: swap.venue,
            startTime: swap.startTime,
            endTime: swap.endTime,
            day: swap.day,
            user_id: swap.user.id
        }
    end

    private
    
    attr_reader :swap
end