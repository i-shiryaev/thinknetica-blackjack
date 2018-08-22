class Dealer < Player
  attr_reader :hidden_hand

  def initialize
    super('Dealer')
  end

  def open_hand!
    @hand.open!
  end
end
