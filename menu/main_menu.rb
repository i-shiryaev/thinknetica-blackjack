require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/dealer.rb'
require_relative '../lib/bank.rb'
require_relative 'output_helper.rb'

class MainMenu
  def initialize
    @helper = OutputHelper.new
    @bank = Bank.new
    @dealer = Dealer.new
  end

  def start_game
    create_player
    gameplay_loop
  end

  private

  attr_accessor :deck, :player, :dealer
  attr_reader :helper, :bank, :player_finished, :dealer_finished

  def gameplay_loop
    another_round = true
    while player.balance > 0 && dealer.balance > 0 && another_round
      game_round
      another_round = another_round?
      break unless another_round
    end
    another_game? ? start_game : exit
  end

  def another_game?
    helper.message :another_game
    helper.message :yes_or_no
    helper.check_user_input(%w[y n]) == 'y'
  end

  def another_round?
    return false if player.balance.zero? || dealer.balance.zero?
    helper.message :another_round
    helper.message :yes_or_no
    helper.check_user_input(%w[y n]) == 'y'
  end

  def game_round
    prepare_round
    deal_initial_cards
    helper.game_ui(player, dealer, bank)
    bank.make_bets(player, dealer)
    game_turn until player_finished && dealer_finished
    open_cards
    decide_winner
  end

  def game_turn
    player_turn unless player_finished
    dealer_turn unless dealer_finished
  end

  def create_player
    helper.message :enter_name
    name = helper.user_input
    begin
      @player = Player.new(name)
    rescue StandardError => e
      show_error(e)
      name = helper.user_input
      retry
    end
  end

  def decide_winner
    if busted?(player.hand.score)
      helper.message :busted
      player_lost
    elsif busted?(dealer.hand.score)
      helper.message :dealer_busted
      player_won
    elsif player.hand.score == dealer.hand.score
      draw
    elsif player.hand.score > dealer.hand.score
      player_won
    else
      player_lost
    end
  end

  def player_won
    helper.message :player_won
    bank.win(player)
  end

  def player_lost
    helper.message :player_lost
    bank.win(dealer)
  end

  def draw
    helper.message :draw
    bank.undo_bets(player, dealer)
  end

  def busted?(score)
    score > 21
  end

  def player_turn
    helper.message :player_turn
    helper.player_options
    input = helper.check_user_input(%w[1 2 3])
    case input
    when '1' then skip_turn
    when '2' then add_card
    when '3' then force_open_cards
    else message :enter_another_value
    end
  end

  def force_open_cards
    player_finish_turn
    dealer_finish_turn
  end

  def skip_turn
    helper.player_skipped_turn(player)
    player_finish_turn
  end

  def add_card
    player.take_card(deal_card)
    if busted?(player.hand.score) || player.hand.score >= 20
      player_finish_turn
      return false
    end
    helper.player_hand(player)
    helper.player_hand_value(player)
  end

  def open_cards
    dealer.open_hand!
    helper.player_hand(player)
    helper.player_hand_value(player)
    helper.player_hand(dealer)
    helper.player_hand_value(dealer)
  end

  def dealer_turn
    if busted?(player.hand.score)
      dealer_finish_turn
      return false
    end
    helper.message :dealer_turn
    dealer_decision
  end

  def dealer_decision
    if dealer.hand.score > player.hand.score && player_finished
      dealer_passed
    elsif dealer.hand.score <= 17
      helper.message :dealer_take_card
      dealer.take_card(deal_card)
    else
      dealer_passed
    end
  end

  def dealer_passed
    helper.message :dealer_pass
    dealer_finish_turn
  end

  def deal_initial_cards
    2.times do
      player.take_card(deal_card)
      dealer.take_card(deal_card)
    end
    player_finish_turn if player.hand.score >= 20
  end

  def deal_card
    deck.cards.shift
  end

  def prepare_round
    @deck = Deck.new
    @player_finished = false
    @dealer_finished = false
    player.prepare_for_round
    dealer.prepare_for_round
  end

  def player_finish_turn
    @player_finished = true
  end

  def dealer_finish_turn
    @dealer_finished = true
  end
end
