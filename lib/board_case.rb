require 'pry'

class BoardCase

  #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case
  attr_accessor :case_id, :case_symbol

  #TO DO : doit régler sa valeur, ainsi que son numéro de case
  def initialize(board_case_id)
    @case_id = board_case_id
    @case_symbol = nil
  end

end

#binding.pry