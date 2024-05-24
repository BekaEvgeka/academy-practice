# frozen_string_literal: true

def foobar
  puts 'Enter first number:'
  first_num = gets.chomp.to_i
  puts 'Enter second number:'
  second_num = gets.chomp.to_i
  puts 'Output is:'
  if (first_num == 20) || (second_num == 20)
    puts second_num
  else
    puts first_num + second_num
  end
end

foobar
