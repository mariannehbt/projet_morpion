require 'pry'
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/board_case'
require_relative 'lib/show'

system('clear')
my_game = Game.new

Show.new.show_board(my_game.my_board.board_array)

my_game.play_turn

  	# puts
  	# puts " #{my_game.my_board.board_array[0].case_id} | #{my_game.my_board.board_array[1].case_id} | #{my_game.my_board.board_array[2].case_id} "
  	# puts "-" * 10
  	# puts " #{my_game.my_board.board_array[3].case_id} | #{my_game.my_board.board_array[4].case_id} | #{my_game.my_board.board_array[5].case_id} "
  	# puts "-" * 10
  	# puts " #{my_game.my_board.board_array[6].case_id} | #{my_game.my_board.board_array[7].case_id} | #{my_game.my_board.board_array[8].case_id} "



#binding.pry