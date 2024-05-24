# frozen_string_literal: true

def create_pokemon
  puts 'How much pokemon would you like to make?'
  number_of_pokemon = gets.chomp.to_i
  if number_of_pokemon <= 0
    puts 'No pokemon are to be made'
    false
  else
    pokemon_array = []
    number_of_pokemon.times do
      puts 'Enter pokemon name:'
      poke_name = gets.chomp
      puts 'Enter pokemon color:'
      poke_colour = gets.chomp
      pokemon = { name: poke_name, colour: poke_colour }
      pokemon_array << pokemon
    end
    p pokemon_array
    true
  end
end
create_pokemon
