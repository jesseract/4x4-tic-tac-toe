class HumanPlayer

  def get_user_input
    gets.chomp.to_i
  end

  def choose_square(board, game)
    puts "Which square do you choose?"
    return get_user_input
  end

  def display_board_status
    puts ""
    board.display
  end

end
