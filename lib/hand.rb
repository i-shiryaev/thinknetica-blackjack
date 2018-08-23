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
    check_aces if @score > 21
  end

  def closed?
    closed_hand
  end

  def open!
    @closed_hand = false
  end

  private

  attr_reader :closed_hand

  def check_aces
    @cards.each { |card| @score -= 10 if card.rank == 'a' }
  end
end
