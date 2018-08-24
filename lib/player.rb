require_relative 'hand.rb'

class Player
  attr_reader :name, :balance, :hand, :score, :finished

  INITIAL_BALANCE = 100

  def initialize(name)
    @name = name
    @balance = INITIAL_BALANCE
    @hand = Hand.new(false)
    validate!
  end

  def take_card(card)
    @hand.add_card(card)
  end

  def make_bet(bet)
    @balance -= bet
  end

  def take_money(value)
    @balance += value
  end

  def create_hand(closed = false)
    @hand = Hand.new(closed)
  end

  private

  def validate!
    raise 'Name should not be empty.' if @name.empty?
  end
end
