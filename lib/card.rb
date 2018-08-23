class Card
  attr_reader :rank, :value

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

  SUITS = {
    spade: "\u2660",
    heart: "\u2665",
    diamond: "\u2666",
    club: "\u2663"
  }.freeze

  VALUES = {
    2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10,
    'j' => 10, 'q' => 10, 'k' => 10, 'a' => 1
  }.freeze

  def card_value(rank)
    VALUES[rank]
  end

  def suit_unicode(suit)
    case suit
    when :spade then SUITS[:spade]
    when :heart then SUITS[:heart]
    when :diamond then SUITS[:diamond]
    when :club then SUITS[:club]
    else false
    end
  end
end
