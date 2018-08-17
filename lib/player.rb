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
end
