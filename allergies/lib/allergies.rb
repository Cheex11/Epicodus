def allergies(input)
  allergie_number = input
  results = []
  allergies = ['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']
  # allergies = {1 => 'eggs', 2 => 'peanuts', 4 => 'shellfish', 8 => 'strawberries', \
  #                16 => 'tomatoes', 32 => 'chocolate', 64 => 'pollen', 128 => 'cats'}

  for i in (7).downto(0)
    if allergie_number >= (2 ** i)
        results.push(allergies[i])
        allergie_number = allergie_number - (2 ** i)   
    end
  end
  results
end

input = 0
while input != 'exit'
  puts "What's your allergy score?"
  input = gets.chomp
  puts allergies(input.to_i).join(" ")
end
