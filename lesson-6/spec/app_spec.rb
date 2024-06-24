

require_relative '../app'
require 'rspec'

describe 'Testing app' do

    let(:account_balance) {100}
    let(:deposit_amount) {125}
    let(:withdraw_amount) {100}
    let(:app) {App.new}
    let(:full_path) do
        {
            hi_mom: '/',
            hi_user: '/user',
            deposit: "/cash_machine?method=deposit&value=#{deposit_amount}",
            withdraw: "/cash_machine?method=withdraw&value=#{withdraw_amount}",
            balance: "/cash_machine?method=balance"
        }
    end

    before do
        File.write('test_account.txt', account_balance)
    end

    it 'deposit' do
        path, params = full_path[:deposit].split('?')
        params = params.split('&').map {|pair| pair.split('=')}.to_h
        expect(app.router(path, params)[2].to 
                            eq(["You have deposited $#{deposit_amount.to_i} into your bank account"]))
    end

    it 'withdraw' do 
        path, params = full_path[:withdraw].split('?')
        params = params.split('&').map {|pair| pair.split('=')}.to_h
        expect(app.router(path, params)[2]).to 
                            eq(["Withdrawn $#{withdraw_amount} from your account"])
    end

    it 'check_balance' do
        path, params = full_path[:balance].split('?')
        params = params.split('&').map {|pair| pair.split('=')}.to_h
        expect(app.router(path, params)[2]).to eq(["Current balance: #{account_balance}"])
    end

    it 'Hello world!' do
        path = full_path[:hi_mom].split('?')[0]
        params = ''
        params = params.split('&').map {|pair| pair.split('=')}.to_h
        expect(app.router(path, params)[2]).to eq(['Hi mom'])
    end

    it 'Hello user!' do
        path = full_path[:hi_user].split('?')[0]
        params = ''
        params = params.split('&').map {|pair| pair.split('=')}.to_h
        expect(app.router(path, params)[2]).to eq(['Hi user'])
    end

end