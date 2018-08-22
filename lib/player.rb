require_relative 'hand.rb'

class Player
  attr_reader :name, :balance, :hand, :score, :finished

  def initialize(name)
    @name = name
    create_hand
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
    @hand = is_dealer?(@name) ? Hand.new(true) : Hand.new(false)
  end
end
