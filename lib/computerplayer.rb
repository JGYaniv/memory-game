class ComputerPlayer

    attr_accessor :known_cards

    def intialize
        @known_cards = Hash.new {Array.new(2)}
        @matched_cards = {}

    end

    def take_turn(game_board)
        @game = game_board
        
    end

    def make_a_guess


    end


    def recieve_revealed_cards

    end

    def recieve_match

    end


    def refresh(game_board, *num)
        num = num[0] || 0
        system("clear")
        game_board.render
        sleep(num)
    end

    def valid(guess)
        #ensures a guess is valid syntax
        if guess.instance_of?(Array)
            return true if guess.length == 2 && guess[0] < 4 && guess[1] < 4
        end

        false
    end

end