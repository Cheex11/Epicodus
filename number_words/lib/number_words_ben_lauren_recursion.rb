# def number_words(number)

#   numbers = []
#   while number > 0
#     numbers.push(group_three(number % 1000))
#     number = ((number / 1000).to_f).floor
#   end

  # results = numbers.map.with_index do |number, index|
  #   number = number + big_numbers[index]
  # end
#   results.reverse.join(" ")
# end

def number_words(number, index=0)
  one_nineteen = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",  6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}
  tens = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}
  big_numbers = {0 => "", 1 => " thousand", 2 => " million", 3 => " billion", 4 => " trillion", 5 => " quadrillion", 6 => " quintillion"}
  results = []
  formatted_results = []

  if number > 999
    results.push(number_words(((number / 1000).to_f).floor), index + 1)

    results.push(number_words(number % 1000))
    number = 0
  end


  if number > 99
    results.push(one_nineteen[number / 100]+ " hundred")
    number = number % 100
  end
  if number < 100 && number > 19
    results.push(tens[(number/10).floor])
    number = number % 10
  end
  if number < 20 && number > 0
    results.push(one_nineteen[number])
  end
  puts results
  formatted_results = results.map do |result|
    result = result + big_numbers[index]
  end
  formatted_results.join(" ")
end

number_words(456987)
