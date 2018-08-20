require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/dealer.rb'
require_relative 'output_helper.rb'

class MainMenu
  include OutputHelper

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
  end

  def start_game
    create_player
    deal_initial_cards
    game_ui
    players_bet
  end

  private

  attr_accessor :deck, :player, :dealer

  def create_player
    show_message :enter_name
    @player = Player.new(user_input)
  end

  def game_ui
    show_balance
    dealer_hand
    player_hand
    hand_value
  end

  def deal_initial_cards
    2.times do
      player.take_card(deal_card)
      dealer.take_card(deal_card)
    end
  end

  def deal_card
    deck.cards.shift
  end

  def players_bet
    player.bet
    dealer.bet
  end
end
