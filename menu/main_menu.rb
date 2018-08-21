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
    player_turn
  end

  private

  attr_accessor :deck, :player, :dealer

  def create_player
    message :enter_name
    @player = Player.new(user_input)
  end

  def player_turn
    message :player_turn
    player_options
    input = user_input
    until valid_input?(input)
      message :enter_another_value
      input = user_input
    end
    case input
    when '1' then skip_turn
    when '2' then add_card
    when '3' then open_cards
    else message :enter_another_value
    end
  end

  def skip_turn
    player_skipped_turn
    dealer_turn
  end

  def add_card
    player.take_card(deal_card)
    player_hand
    player_hand_value
  end

  def open_cards
    dealer.open_hand!
    player_hand
    player_hand_value
    dealer_hand
    dealer_hand_value
  end

  def dealer_turn
    message :dealer_turn
    if dealer.score < 17
      message :dealer_take_card
      dealer.take_card(deal_card)
    else
      message :dealer_pass
    end
  end

  def valid_input?(input)
    %w[1 2 3].include?(input)
  end

  def game_ui
    show_balance
    dealer_hand
    player_hand
    player_hand_value
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
