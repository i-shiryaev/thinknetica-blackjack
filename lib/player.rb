class Player
  attr_reader :name, :balance, :hand, :score

  def initialize(name)
    @name = name
    @balance = 100
    @hand = []
    @score = 0
  end

  def bet
    @balance -= 10
  end

  def take_card(card)
    card.rank == 'a' ? value = card.value : value = manage_ace_value
    @hand << card
    @score += card.value
  end

  def show_hand
    cards = []
    @hand.each{ |card| cards << card.show }
    cards.join(' ')
  end

  def reset_score!
    @score = 0
  end

  private

  def manage_ace_value
    score + 11 > 21 ? 1 : 11
  end
end
