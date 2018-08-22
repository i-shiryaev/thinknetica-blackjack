class Bank
  attr_reader :player_balance, :dealer_balance

  INITIAL_BALANCE = 100

  def initialize
    @dealer_balance = INITIAL_BALANCE
  end

  def bet
    @player_balance -= 10
    @dealer_balance -= 10
  end

  def return_money!
    @player_balance += 10
    @dealer_balance += 10
  end

  def player_won
    @player_balance += 20
  end

  def dealer_won
    @dealer_balance += 20
  end

  def reset_player_balance!
    @player_balance = INITIAL_BALANCE
  end
end
