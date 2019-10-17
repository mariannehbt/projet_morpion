require 'pry'

class Show

  #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
  def show_board(show_my_board)
  	puts
  	puts " #{show_my_board[0].case_symbol} | #{show_my_board[1].case_symbol} | #{show_my_board[2].case_symbol} "
  	puts "-" * 10
  	puts " #{show_my_board[3].case_symbol} | #{show_my_board[4].case_symbol} | #{show_my_board[5].case_symbol} "
  	puts "-" * 10
  	puts " #{show_my_board[6].case_symbol} | #{show_my_board[7].case_symbol} | #{show_my_board[8].case_symbol} "
  end

end