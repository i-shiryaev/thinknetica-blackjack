class Player
  attr_reader :name, :balance, :hand, :score, :finished

  def initialize(name)
    @name = name
    @hand = []
    @finished = false
    validate!
  end

  def take_card(card, score, bank)
    value = card.rank == 'a' ? manage_ace_value(score) : card.value
    @hand << card
    name == 'Dealer' ? bank.increase_dealer_score(value) : bank.increse_player_score(value)
  end

  def show_hand
    cards = []
    @hand.each { |card| cards << card.show }
    cards.join(' ')
  end

  def prepare_for_round
    @finished = false
    clear_hand!
  end

  def finish_round!
    @finished = true
  end

  private

  def manage_ace_value(score)
    score + 11 > 21 && score + 1 < 21 ? 1 : 11
  end

  def validate!
    raise 'Name should not be empty.' if @name.empty?
  end

  def clear_hand!
    @hand = []
  end
end
