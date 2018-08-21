require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/dealer.rb'
require_relative 'output_helper.rb'

class MainMenu
  include OutputHelper

  def initialize
    @dealer = Dealer.new
  end

  def start_game
    create_player
    gameplay_loop
  end

  private

  attr_accessor :deck, :player, :dealer

  def gameplay_loop
    another_round = true
    while player.balance > 0 && dealer.balance > 0 && another_round
      game_round
      another_round = another_round?
      exit unless another_round
    end
    another_game? ? start_game : exit
  end

  def another_game?
    message :another_game
    check_user_input(%w[y n]) == 'y' ? true : false
  end

  def another_round?
    message :another_round
    check_user_input(%w[y n]) == 'y' ? true : false
  end

  def game_round
    prepare_round
    deal_initial_cards
    game_ui
    players_bet
    player_turn
  end

  def create_player
    message :enter_name
    name = user_input
    begin
      @player = Player.new(name)
    rescue StandardError => e
      show_error(e)
      name = user_input
      retry
    end
  end

  def player_turn
    message :player_turn
    player_options
    input = check_user_input(%w[1 2 3])
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

  def check_user_input(options)
    input = user_input
    until valid_input?(options, input)
      message :enter_another_value
      input = user_input
    end
    input
  end

  def valid_input?(options, input)
    options.include?(input)
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

  def prepare_round
    @deck = Deck.new
    player.clear_hand!
    player.clear_score!
    dealer.clear_hand!
    dealer.clear_score!
  end
end
