class Dealer < Player
  attr_reader :hidden_hand

  def initialize
    @hidden_hand = true
    super('Dealer')
  end

  def show_hand
    return '* ' * @hand.size if hidden_hand
    super
  end

  def open_hand!
    @hidden_hand = false
  end

  def close_hand!
    @hidden_hand = true
  end
end
