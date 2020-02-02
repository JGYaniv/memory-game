require_relative './lib/board.rb'
require_relative './lib/card.rb'
require_relative './lib/humanplayer.rb'
require_relative './lib/computerplayer.rb'

class Game
    def initialize
        #setup player
        puts "Enter 'human' or 'computer' to start game:"
        player_type = gets.chomp

        @player = HumanPlayer.new if player_type == 'human'
        @player = ComputerPlayer.new if player_type == 'computer'

        #creates game instance and loops until it is over
        @game = Board.new
        play

    end

    def play
        #game loop, breaks when all cards are flipped up
        while true
            @player.take_turn(@game)
            refresh
            abort("You're a winner!") if @game.won?
        end
    end

    def refresh(*num)
        num = num[0] || 0
        system("clear")
        @game.render
        sleep(num)
    end
end

if __FILE__ == $PROGRAM_NAME
    play = Game.new
end
