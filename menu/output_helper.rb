class OutputHelper
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

  private_constant :MESSAGES

  def message(message)
    puts MESSAGES[message]
  end

  def user_input
    gets.chomp
  end

  def show_balance(player, dealer)
    puts "#{player.name}: #{player.balance}$ | Dealer: #{dealer.balance}$"
  end

  def show_hand(hand)
    if hand.closed?
      '* ' * hand.cards.size
    else
      cards = []
      hand.cards.each { |card| cards << card.show }
      cards.join(' ')
    end
  end

  def player_hand(player)
    puts "#{player.name}'s' hand: #{show_hand(player.hand)}"
  end

  def player_hand_value(player)
    puts "#{player.name}'s' hand value: #{player.hand.score}"
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
    puts "#{player.name} decided to skip a turn. Total score: #{player.hand.score}"
  end

  def game_ui(player, dealer, bank)
    show_balance(player, dealer)
    player_hand(dealer)
    player_hand(player)
    player_hand_value(player)
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

  def valid_input?(options, input)
    options.include?(input)
  end
end
