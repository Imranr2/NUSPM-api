class UserRepresenter
    def initialize(user)
        @user = user
    end

    def as_json
        {
            email: user.email
        }
    end

    private
    
    attr_reader :user
end