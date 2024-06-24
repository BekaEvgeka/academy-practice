# frozen_string_literal: true

require_relative '../cash_machine'
require 'rspec'

describe 'Cash machine test' do
  let(:account_balance) { 100 }
  let(:deposit_amount) { 125 }
  let(:withdraw_amount) { 100 }
  let(:cash_machine) { CashMachine.new('test_account.txt') }

  before do
    File.write(account, 100)
  end

  it 'no_change' do
    cash_machine.no_change
    expect(cash_machine.get_balance).to eq(account_balance)
  end

  it 'deposit' do
    allow_any_instance_of(Kernel).to recieve(:gets).and_return(deposit_amount)
    cash_machine.deposit
    expect(cash_machine.get_balance).to eq(account_balance + deposit_amount.to_i)
  end

  it 'withdraw' do
    allow_any_instance_of(Kernel).to recieve(:gets).and_return(withdraw_amount)
    cash_machine.withdraw
    expect(cash_machine.get_balance).to eq(account_balance - withdraw_amount.to_i)
  end
end
