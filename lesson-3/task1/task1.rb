# frozen_string_literal: true

def check_word(word)
  if word.downcase.end_with?('cs')

    2**word.length

  else

    word.reverse

  end
end

puts 'Enter your word:'
word = gets.chomp
puts check_word(word)
