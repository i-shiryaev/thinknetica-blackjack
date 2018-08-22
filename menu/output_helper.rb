class OutputHelper
  def message(message)
    puts MESSAGES[message]
  end

  def user_input
    gets.chomp
  end

  def show_balance(player, bank)
    puts "#{player.name}: #{bank.player_balance}$ | Dealer: #{bank.dealer_balance}$"
  end

  def player_hand(player)
    puts "#{player.name} hand: #{player.show_hand}"
  end

  def player_hand_value(player, score)
    puts "#{player.name}'s' hand value: #{score}"
  end

  def dealer_hand_value(score)
    puts "Dealer's' hand value: #{score}"
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

  def player_skipped_turn(player)
    puts "#{player.name} decided to skip a turn. Total score: #{player.score}"
  end

  def game_ui(player, dealer, bank)
    show_balance(player, bank)
    player_hand(dealer)
    player_hand(player)
    player_hand_value(player, bank.player_score)
  end

  def check_user_input(options)
    input = user_input
    until valid_input?(options, input)
      message :enter_another_value
      input = user_input
    end
    input
  end

  private

  MESSAGES = {
    enter_name: 'Please enter your name:',
    enter_another_value: 'Enter another value:',
    player_turn: 'Your turn:',
    dealer_turn: 'Dealer turn:',
    dealer_take_card: 'Dealer decided to take a card.',
    dealer_pass: 'Dealer decided to pass.',
    another_game: 'Do you want to start another game?',
    another_round: 'Do you want to start another round?',
    thank_you: 'Thank you for playing.',
    yes_or_no: '[y]es / [n]o?',
    busted: 'Busted!',
    dealer_busted: 'Dealer got busted.',
    player_won: 'You won!',
    player_lost: "You've lost!",
    draw: "It's a draw!"
  }.freeze

  def valid_input?(options, input)
    options.include?(input)
  end
end
