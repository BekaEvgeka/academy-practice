
def check_word(word)
   
    if word.downcase.end_with?("cs")
        
        return 2 ** word.length
        
    else 

        return word.reverse
        
    end
end

puts "Enter your word:"
word = gets.chomp
puts check_word(word)