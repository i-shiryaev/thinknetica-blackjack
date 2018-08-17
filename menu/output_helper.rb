module OutputHelper
  MESSAGES = {
    enter_name: 'Please enter your name: '
  }

  def show_message(message)
    puts MESSAGES[message]
  end
end
