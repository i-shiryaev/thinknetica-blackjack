require_relative 'hand.rb'

class Player
  attr_reader :name, :balance, :hand, :score, :finished

  INITIAL_BALANCE = 100

  def initialize(name)
    @name = name
    @balance = INITIAL_BALANCE
    @hand = Hand.new(false)
    @finished = false
    validate!
  end

  def take_card(card)
    @hand.add_card(card)
  end

  def prepare_for_round
    @finished = false
    clear_hand!
  end

  def finish_round!
    @finished = true
  end

  def make_bet(bet)
    @balance -= bet
  end

  def take_money(bet)
    @balance += bet
  end

  private

  def validate!
    raise 'Name should not be empty.' if @name.empty?
  end

  def clear_hand!
    create_hand
  end

  def is_dealer?(name)
    name == 'Dealer'
  end

  def create_hand
    @hand = Hand.new(false)
  end
end
