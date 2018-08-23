class Dealer < Player
  attr_reader :hidden_hand

  def initialize
    super('Dealer')
  end

  def open_hand!
    @hand.open!
  end

  def create_hand
    @hand = Hand.new(true)
  end
end
