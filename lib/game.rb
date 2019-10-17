require 'pry'

class Game

  #TO DO : la classe a plusieurs attr_accessor: le @current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :my_board, :players_array, :current_player
    #le @current_player (égal à un objet Player),
    #le status (en cours, nul ou un objet Player s'il gagne),
    #et un array contenant les 2 joueurs.

  #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un @current_player
  def initialize
    @players_array = []
    # Création des 2 joueurs
    puts "Joueur 1, quel est ton prénom ?"
    print "> "
    player1_name = gets.chomp
    @player1 = Player.new(player1_name, "o")
    @players_array << @player1
    puts "Bienvenue #{@player1.name} ! Tu as le symbole o"

    puts "Joueur 2, quel est ton prénom ?"
    print "> "
    player2_name = gets.chomp
    @player2 = Player.new(player2_name, "x")
    @players_array << @player2
    puts "Bienvenue #{@player2.name} ! Tu as le symbole x"

    # Création du board
    @my_board = Board.new
    @my_board.board_array << BoardCase.new("A1")
    @my_board.board_array << BoardCase.new("A2")
    @my_board.board_array << BoardCase.new("A3")
    @my_board.board_array << BoardCase.new("B1")
    @my_board.board_array << BoardCase.new("B2")
    @my_board.board_array << BoardCase.new("B3")
    @my_board.board_array << BoardCase.new("C1")
    @my_board.board_array << BoardCase.new("C2")
    @my_board.board_array << BoardCase.new("C3")

    #met le status à "on going"
    #défini un @current_player
  end

  #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  # def turn
  # end

  #TO DO : une méthode qui :
  #1) demande au bon joueur ce qu'il souhaite faire
  #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
  def play_turn
    @current_player = @players_array[rand(0..1)]
    while !victory? && !drawn_game?
      puts "#{@current_player.name}, choisis un chiffre entre 0 et 8 ?"
      print "> "
      player_choice = Integer(gets) rescue false

      while player_choice == false || player_choice < 0 || player_choice > 8
        puts "Choisis un chiffre entre 0 et 8 stp !"
        print "> "
        player_choice = Integer(gets) rescue false
      end

      while @my_board.board_array[player_choice].case_symbol != nil
        puts "Choisis une case vide stp !"
        print "> "
        player_choice = Integer(gets) rescue false
      end

      @my_board.board_array[player_choice].case_symbol = @current_player.symbol
      my_display = Show.new.show_board(@my_board.board_array)
      @current_player = (@players_array - [@current_player])[0]
    end

    if victory? then puts "#{(@players_array - [@current_player])[0].name} tu as gagné petit malin !"
    elsif drawn_game? then puts "Match nul"
    end
  end

  #méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board)
  #Elle affiche le plateau,
  #demande au joueur ce qu'il joue,
  #vérifie si un joueur a gagné,
  #passe au joueur suivant si la partie n'est pas finie.

  #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  def victory?
    winning_combinaisons =
    [["A1", "A2", "A3"],
    ["B1", "B2", "B3"],
    ["C1", "C2", "C3"],
    ["A1", "B1", "C1"],
    ["A2", "B2", "C2"],
    ["A3", "B3", "C3"],
    ["A3", "A2", "A1"],
    ["B3", "B2", "B1"],
    ["C3", "C2", "C1"],
    ["C1", "B1", "A1"],
    ["C2", "B2", "A2"],
    ["C3", "B3", "A3"],
    ["A1", "B2", "C3"],
    ["C1", "B2", "A3"],
    ["C3", "B2", "A1"],
    ["A3", "B2", "C1"]]

    @x_board = []
    @o_board = []

    @my_board.board_array.each do |cells|
      if cells.case_symbol == "x"
        then @x_board << cells.case_id
      end
      if cells.case_symbol == "o"
        then @o_board << cells.case_id
      end
    end

    winning_combinaisons.any? { |combinaisons| (combinaisons - @x_board) == [] || (combinaisons - @o_board) == [] }

    # une méthode qui vérifie le plateau et
    # indique s'il y a un vainqueur ou match nul
  end

  def drawn_game?
    !victory? && @x_board.length + @o_board.length == 9
  end

  # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  def new_round
    #relance une partie en initialisant un nouveau board
    #mais en gardant les mêmes joueurs.
  end

  # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  def game_end
    #permet l'affichage de fin de partie quand un vainqueur est détecté
    #ou si il y a match nul
  end    

end

#binding.pry