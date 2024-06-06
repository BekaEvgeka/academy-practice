# frozen_string_literal: true

class CashMachine
  def initialize(bank_account)
    @default_balance = 100
    @account = bank_account

    @account_balance = if File.exist?(@account)
                         File.read(@account)
                       else
                         @default_balance
                       end

    @main_menu_text = "What would you like to do with your account?\n
            Enter 'D' to make a deposit into your account\n
            Enter 'W' to withdraw from your account\n
            Enter 'B' to check your current balance\n
            Enter 'Q' to quit."

    @follow_up_text = "What else would you like to do with your account?\n
            Enter 'D' to make a deposit into your account\n
            Enter 'W' to withdraw from your account\n
            Enter 'B' to check your current balance\n
            Enter 'Q' to quit."

    start_transaction
  end

  def deposit
    puts 'Enter how much would you like to deposit. The amount must be positive.'
    loop do
      response = gets.chomp

      if response.to_f.positive?
        @account_balance = @account_balance.to_f + response.to_f
        puts "You have deposited $#{response} into your bank account"
        return @account_balance.to_f
      else
        puts 'You`ve entered a bad number, please try again!'
      end
    end
  end

  def withdraw
    puts 'Enter how much would you like to withdraw. The amount must be positive.'

    loop do
      response = gets.chomp

      if response.to_f.positive?
        if response.to_f <= @account_balance.to_f
          @account_balance = @account_balance.to_f - response.to_f
          puts "Withdrawn $#{response.to_f} from your account"
          return @account_balance
        else
          puts 'Sorry, but you don`t have enough money to withdraw this much'
          next
        end
      else
        puts 'You`ve entered a bad number, please try again!'
      end
    end
  end

  def get_balance
    @account_balance
  end

  def quit
    File.write(@account, @account_balance)
  end

  def start_transaction
    puts 'Greetings, let`s check your account balance....'
    puts "Your balance is $#{@account_balance}"

    puts @main_menu_text

    loop do
      response = gets.chomp.downcase
      case response
      when 'd'
        deposit
        sleep(1)
        puts @follow_up_text

      when 'w'
        withdraw
        sleep(1)
        puts @follow_up_text

      when 'b'
        puts "Your balance is: $#{get_balance}"
        sleep(1)
        puts @follow_up_text

      when 'q'
        quit
        puts 'Goodbye!'
        break

      end
    end
  end
end

# ACCOUNT_PATH = "bank_account.txt"
# DEFAULT_BALANCE = 100

CashMachine.new('bank_account.txt')
