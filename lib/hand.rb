class Hand
  attr_reader :score, :cards

  def initialize(closed_hand)
    @closed_hand = closed_hand
    @cards = []
    @score = 0
  end

  def add_card(card)
    value = card.rank == 'a' ? manage_ace_value(score) : card.value
    @cards << card
    @score += value
  end

  def closed?
    closed_hand
  end

  def open!
    @closed_hand = false
  end

  private

  attr_reader :closed_hand

  def manage_ace_value(score)
    score + 11 > 21 && score + 1 < 21 ? 1 : 11
  end
end
