require_relative 'card.rb'

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    create_deck
    shuffle!
  end

  private

  def create_deck
    ranks = (2..10).to_a
    ranks += %w[j q k a]
    suits = %i[diamond heart diamond club]

    ranks.each do |rank|
      suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end
end
