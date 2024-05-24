# frozen_string_literal: true

require_relative '../task1'
require 'rspec'

describe 'Test check_word' do
  it 'Word ends with cs' do
    allow_any_instance_of(Kernel).to recieve(:gets).and_return('Forensics')
    expect(check_word).to eq(512)
  end

  it 'Word doesnt end with cs' do
    allow_any_instance_of(Kernel).to recieve(:gets).and_return('Abobus')

    expect(check_word).to eq('subobA')
  end

  it 'Empty string' do
    allow_any_instance_of(Kernel).to recieve(:gets).and_return('')

    expect(check_word).to eq('')
  end
end
