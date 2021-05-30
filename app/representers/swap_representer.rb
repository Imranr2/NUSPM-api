class SwapRepresenter
    def initialize(swap)
        @swap = swap
    end

    def as_json
        {
            # id: @swap.id,
            # email: @swap.email
        }
    end

    private
    
    attr_reader :swap
end