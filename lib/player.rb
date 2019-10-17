require 'pry'

class Player
  
  #TO DO : la classe a 2 attr_reader, son nom et sa valeur (X ou O).
  attr_reader :name, :symbol

  #TO DO : doit régler son nom et sa valeur
  def initialize(player_name, player_symbol)
    @name = player_name
    @symbol = player_symbol
  end

end

#binding.pry