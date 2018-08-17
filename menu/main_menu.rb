require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative 'output_helper.rb'

class MainMenu
  include OutputHelper

  def initialize
    @deck = Deck.new
    @player = Player.new('Player')
    @dealer = Player.new('Dealer')
  end

  def show_menu
    show_message :enter_name
  end

  private

  attr_accessor :deck
end
