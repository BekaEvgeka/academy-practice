# frozen_string_literal: true

BALANCE_PATH = 'balance.txt'
# Try to get balance first, if unavailable - set it to default: 100
DEFAULT_BALANCE = 100
current_balance = 0

main_menu_text = "What would you like to do with your account?\n
    Enter 'D' to make a deposit into your account\n
    Enter 'W' to withdraw from your account\n
    Enter 'B' to check your current balance\n
    Enter 'Q' to quit."

follow_up_text = "What else would you like to do with your account?\n
    Enter 'D' to make a deposit into your account\n
    Enter 'W' to withdraw from your account\n
    Enter 'B' to check your current balance\n
    Enter 'Q' to quit."

def read_balance(balance)
  if File.exist?(balance)
    File.read(balance)
  else
    DEFAULT_BALANCE
  end
end

def deposit(current_balance)
  puts 'Enter how much would you like to deposit. The amount must be positive.'
  loop do
    response = gets.chomp

    if response.to_f.positive?

      current_balance = current_balance.to_f + response.to_f
      puts "Deposited $#{response} to your balance"
      return current_balance.to_f
    else
      puts 'You`ve entered a bad number, please try again!'
    end
  end
end

def withdraw(current_balance)
  puts 'Enter how much would you like to withdraw. The amount must be positive.'

  loop do
    response = gets.chomp

    if response.to_f.positive?
      if response.to_f <= current_balance.to_f
        current_balance = current_balance.to_f - response.to_f
        puts "Witrdrawn $#{response.to_f} from your account"
        return current_balance
      else
        puts 'Sorry, but you don`t have enough money to withdraw this much'
      end
    else
      puts 'You`ve entered a bad number, please try again!'
    end
  end
end

def quit(balance, current_balance)
  File.write(balance, current_balance)
  puts 'Goodbye!'
end

puts "Greetings, let's check your balance account...."
current_balance = read_balance(BALANCE_PATH)
puts "Your balance is $#{current_balance}"

puts main_menu_text

loop do
  response = gets.chomp.downcase
  case response
  when 'd'
    current_balance = deposit(current_balance)
    sleep(1)
    puts follow_up_text

  when 'w'
    current_balance = withdraw(current_balance)
    sleep(1)
    puts follow_up_text

  when 'b'
    puts "Your balance is: $#{current_balance}"
    sleep(1)
    puts follow_up_text

  when 'q'
    quit(BALANCE_PATH, current_balance)
    break
  else
    puts 'You`ve given a bad response, please try again'
  end
end
