require_relative 'card.rb'

class Board

    attr_accessor :play_board

    def initialize
        system("clear")
        populate
        render
    end

    def populate
        #calls on generate_letter_pool method to select 8 random pairs of letters
        @letter_pool = generate_letter_pool

        #fills the board with cards, whose values are derived from the letter pool
        @play_board = Array.new(4) do 
            Array.new(4) do
                Card.new(@letter_pool.pop)
            end
        end
    end

    def generate_letter_pool
        #creates 8 * 2 letter pool randomly selected from alphabet
        alpha_array = "abcdefghijklmnopqrstuvwxyz".upcase.split("")
        letter_pool = alpha_array.sample(8) * 2
        letter_pool.shuffle
    end

    def render 
        #displays the current boards
        print "\n  0 1 2 3"

        @play_board.each_with_index do |row, idx|
            print "\n#{idx}"
            row.each do |el|

                #reveals value if the card is facing up or just an empty slot
                print " #{el}" if el.facing == :up
                print "  " if el.facing == :down
            end
        end

        puts "\n\n"
    end

    def won?
        #returns true if all cards are revealed
        @play_board.each do |row|
            row.each do |el| 
                return false if el.facing == :down
            end
        end
    end

    def reveal(guessed_pos)
        #reveals card at guessed_pos if it is still face down and returns value
        x = guessed_pos[0]
        y = guessed_pos[1]
        card = @play_board[y][x]

        if card.facing == :down
            card.reveal  
        end

        return card.value
    end
end
