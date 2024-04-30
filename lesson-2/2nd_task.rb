
def foobar

    puts "Enter first number:"
    first_num = gets.chomp

    puts "Enter second number:"
    second_num = gets.chomp
    
    puts "Output is:"
    if (first_num.to_i == 20) || (second_num.to_i == 20)

        puts second_num

    else 

        puts first_num.to_i + second_num.to_i
        
    end

end

foobar()