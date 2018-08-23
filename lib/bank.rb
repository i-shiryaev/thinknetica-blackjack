class Bank
  BET = 10

  def initialize
    @prize_money = 0
  end

  def make_bets(player, dealer)
    player.make_bet(BET)
    dealer.make_bet(BET)
    @prize_money += BET * 2
  end

  def undo_bets(player, dealer)
    player.undo_bet(BET)
    dealer.undo_bet(BET)
    clear_bank!
  end

  def win(player)
    player.take_money(@prize_money)
    clear_bank!
  end

  private

  def clear_bank!
    @prize_money = 0
  end
end
