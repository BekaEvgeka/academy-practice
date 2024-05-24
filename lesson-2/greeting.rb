# frozen_string_literal: true

def greeting
  puts 'Enter your name:'
  name = gets.chomp
  puts 'Enter your surname:'
  surname = gets.chomp
  puts 'Enter your age:'
  age = gets.chomp
  if age.to_i >= 18
    puts "Hi, #{name} #{surname}. Time to get to work!"
  else
    puts "Hi, #{name} #{surname}. It would seem you are younger than 18, but its never too early to start learning!"
  end
end

greeting
