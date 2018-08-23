class Hand
  attr_reader :score, :cards

  def initialize(closed_hand)
    @closed_hand = closed_hand
    @cards = []
    @score = 0
  end

  def add_card(card)
    @cards << card
    @score += card.value
    @score += 10 if overdraw_with_ace?(card.rank)
  end

  def closed?
    closed_hand
  end

  def open!
    @closed_hand = false
  end

  private

  attr_reader :closed_hand

  def overdraw_with_ace?(rank)
    return false if rank != 'a'
    @score < 12 # 21 - Default ace value(1) - Additional ace value(10)
  end
end
