# frozen_string_literal: true

class CashMachine

    attr_reader :account_balance :account

    def initialize(bank_account)
      @default_balance = 100
      @account = bank_account
  
      @account_balance = if File.exist?(@account)
                           File.read(@account)
                         else
                           @default_balance
                         end
    end
  
    def deposit(deposit_amount)
        if deposit_amount.to_i >= 0
          @account_balance = @account_balance.to_i + deposit_amount.to_i
          File.write(@account, @account_balance)
          "You have deposited $#{deposit_amount.to_i} into your bank account"

        else
          'You`ve entered a bad number, please try again!'
        end
    end
  
    def withdraw(withdraw_amount)
        if withdraw_amount.positive?
          if withdraw_amount <= @account_balance.to_i
            @account_balance = @account_balance.to_i - withdraw_amount
            "Withdrawn $#{withdraw_amount} from your account"
            File.write(@account, @account_balance)
          else
            'Sorry, but you don`t have enough money to withdraw this much'
          end
        else
          'You`ve entered a bad number, please try again!'
        end
    end
  
    def get_balance
      @account_balance
    end
  
    def quit
      File.write(@account, @account_balance)
    end
end