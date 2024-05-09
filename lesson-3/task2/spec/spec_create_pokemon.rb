
require_relative '../task2'
require 'rspec'

describe 'Test create_pokemon' do

    it 'No amount was given' do
        allow_any_instance_of(Kernel).to recieve(:gets).and_return('')

        expect(create_pokemon).to eq(false)
    end

    it 'Wrong number given' do 
        allow_any_instance_of(Kernel).to recieve(:gets).and_return('-123123')

        expect(create_pokemon).to eq(false)
    end

    it 'Pokemon are made correctly' do
        allow_any_instance_of(Kernel).to recieve(:gets).and_return('2', 'Pikachu', 'Yellow', 'Muk', 'Purple')

        expect(create_pokemon).to eq(true)
    end
end
