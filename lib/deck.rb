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
    arr = (2..10).to_a
    arr += %w(j q k a)
    suits = [:diamond, :heart, :diamond, :club]

    arr.each do |rank|
      suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end
end
