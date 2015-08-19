require './board.rb'

class ComputerPlayer

  def choose_square(board, game)
    if board.total_moves == 0
      return 6
    end

    computer_is_x = (game.first_player == self)

    rated_choices = rate_choices(board, computer_is_x)
    rated_choices.each do |choice, is_good|
      if is_good
        return choice
      end
    end
    return rated_choices.keys[0]
  end


  def rate_choices(board, computer_is_x, depth = 4)
    #make sure successive calls subtract 1 from it (or don't call if it's 0).
    rated_choices = {}
    for choice in 1..16
      if board.can_play_at?(choice)
        rated_choices[choice] = good_board?(board.board_with_move(choice), computer_is_x, depth)
      end
    end
    return rated_choices
  end

  def good_board?(board, computer_is_x, depth)
    if board.game_over?
      result = board.result
      if result == :draw
        return true
      elsif result == :X
        return computer_is_x
      else
        return !computer_is_x
      end
    elsif depth == 0 
        return false
    else
      rated_choices = rate_choices(board, computer_is_x, depth - 1)
      if board.is_x_turn? == computer_is_x
        return rated_choices.values.include?(true)
      else
        return !rated_choices.values.include?(false)
      end
    end
  end
end
