require_relative 'board.rb'
require_relative 'card.rb'

class HumanPlayer

    def initialize

    end

    def take_turn(game_board)
        @game = game_board

        first_guess = make_a_guess
        first_guess_value = @game.reveal(first_guess)
        refresh(@game)
        second_guess = make_a_guess
        second_guess_value = @game.reveal(second_guess)
        
        if first_guess_value != second_guess_value
            refresh(@game, 2)
            @game.play_board[first_guess[1]][first_guess[0]].hide
            @game.play_board[second_guess[1]][second_guess[0]].hide
        end

        refresh(@game)
    end

    def refresh(game_board, *num)
        num = num[0] || 0
        system("clear")
        game_board.render
        sleep(num)
    end

    def make_a_guess
        #gets a pos from user, loops until guess is valid syntax
        puts "Please enter the position you would like to flip (e.g., '2,3')"
        while true 
            guess = gets.chomp

            #quits if you guess 'exit'
            abort("\nNice try loser!\n\n") if guess == "exit"

            #splits guess string '0,0' using the comma then converts to integers
            guess = guess.split(",").map{|el| el.to_i}

            #returns if guess is valid, otherwise the loop restarts
            return guess if valid(guess)
            puts "Please enter a valid coordinate:"
        end
    end

    def valid(guess)
        #ensures a guess is valid syntax
        if guess.instance_of?(Array)
            return true if guess.length == 2 && guess[0] < 4 && guess[1] < 4 
        end

        false
    end
end