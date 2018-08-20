module OutputHelper
  MESSAGES = {
    enter_name: 'Please enter your name: '
  }

  def show_message(message)
    puts MESSAGES[message]
  end

  def user_input
    gets.chomp
  end

  def show_balance
    puts "#{player.name}: #{player.balance}$ | #{dealer.name}: #{dealer.balance}$"
  end

  def player_hand
    puts "#{player.name} hand: #{player.show_hand}"
  end

  def dealer_hand
    puts "Dealer hand: #{dealer.show_hand}"
  end
end
