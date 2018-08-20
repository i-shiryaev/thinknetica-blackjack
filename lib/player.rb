class Player
  attr_accessor :hand
  attr_reader :name, :balance

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
    @hand << card
    @score += card.value
  end

  def show_hand
    cards = []
    @hand.each{ |card| cards << card.show }
    cards.join(' ')
  end
end
