module OutputHelper
  MESSAGES = {
    enter_name: 'Please enter your name:',
    enter_another_value: 'Enter another value:',
    player_turn: 'Your turn:',
    dealer_turn: 'Dealer turn:',
    dealer_take_card: 'Dealer decided to take a card.',
    dealer_pass: 'Dealer decided to pass',
    another_game: 'Do you want to start another game?',
    another_round: 'Do you want to start another round?',
    thank_you: 'Thank you for playing.'
  }

  def message(message)
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

  def player_hand_value
    puts "Your hand's value: #{player.score}"
  end

  def dealer_hand_value
    puts "Dealer hand's value: #{dealer.score}"
  end

  def show_error(error)
    puts error.message
    message :enter_another_value
  end

  def player_options
    puts '1 - to skip a turn'
    puts '2 - to add a card'
    puts '3 - to open cards'
    print '> '
  end

  def player_skipped_turn
    puts "#{player.name} decided to skip a turn. Total score: #{player.score}"
  end
end
