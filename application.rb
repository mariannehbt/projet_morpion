require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/board_case'
require_relative 'lib/show'

while true

system('clear')

my_game = Game.new

Show.new.show_board(my_game.my_board.board_array)

my_game.play_turn

break if my_game.new_round == false

end

puts 'A bientôt !'

#binding.pry