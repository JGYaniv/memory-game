

class Card

    attr_reader :facing
    attr_accessor :value

    def initialize(value)
    #each card has a face value & is either face up or face down
        @facing = :down
        @value = value
    end

    def hide
        #set card to face down
        @facing = :down
    end

    def reveal
        #set card to face up
        @facing = :up
        @value
    end

    def to_s
        #to string method?
        @value.to_s
    end

    def ==(other_value)
        #equivilancy method for card value
        @value == other_value
    end

end