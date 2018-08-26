class Card
  attr_reader :rank, :value

  SUITS = {
    spade: "\u2660",
    heart: "\u2665",
    diamond: "\u2666",
    club: "\u2663"
  }.freeze

  VALUES = {
    2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10,
    'j' => 10, 'q' => 10, 'k' => 10, 'a' => 11
  }.freeze

  private_constant :SUITS, :VALUES

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @suit_unicode = suit_unicode(suit)
    @value = card_value(rank)
  end

  def show
    card_rank = @rank.is_a?(String) ? @rank.capitalize : @rank
    "#{card_rank}#{@suit_unicode}"
  end

  private

  def card_value(rank)
    VALUES[rank]
  end

  def suit_unicode(suit)
    SUITS[suit]
  end
end
