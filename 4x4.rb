require './game.rb'
require './human_player.rb'
require './computer_player.rb'

game = Game.new(HumanPlayer.new, ComputerPlayer.new)
game.play
