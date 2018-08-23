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
    @score += 10 if card.rank == 'a' && @score < 12
  end

  def closed?
    closed_hand
  end

  def open!
    @closed_hand = false
  end

  private

  attr_reader :closed_hand
end
