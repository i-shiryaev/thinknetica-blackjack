class Bank
  attr_reader :player_balance, :dealer_balance, :player_score, :dealer_score

  INITIAL_BALANCE = 100

  def initialize
    @dealer_balance = INITIAL_BALANCE
    @player_score = 0
    @dealer_score = 0
  end

  def bet
    @player_balance -= 10
    @dealer_balance -= 10
  end

  def return_money!
    @player_balance += 10
    @dealer_balance += 10
  end

  def increse_player_score(score)
    @player_score += score
  end

  def increase_dealer_score(score)
    @dealer_score += score
  end

  def player_won
    @player_balance += 20
  end

  def dealer_won
    @dealer_balance += 20
  end

  def clear_score!
    @player_score = 0
    @dealer_score = 0
  end

  def reset_player_balance!
    @player_balance = INITIAL_BALANCE
  end
end
