class Hand
  attr_reader :score, :cards

  def initialize(closed_hand)
    @closed_hand = closed_hand
    @cards = []
    @score = 0
    @aces_amount = 0
  end

  def add_card(card)
    @cards << card
    @score += card.value
    @aces_amount += 1 if is_ace?(card.rank)
    if starting_aces? && aces_amount > 1
      @score -= 10
      return false
    end
    change_aces_value if score > 21 && aces_amount > 0
  end

  def closed?
    closed_hand
  end

  def open!
    @closed_hand = false
  end

  private

  attr_reader :closed_hand, :aces_amount

  def change_aces_value
    aces_amount.times do
      @score -= 10
      @aces_amount -= 1
    end
  end

  def is_ace?(rank)
    rank == 'a'
  end

  def starting_aces?
    aces_amount == cards.size
  end
end
