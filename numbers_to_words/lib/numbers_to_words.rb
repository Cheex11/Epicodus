def numbers_to_words(number)
ones_words = {'1' => "one",
                '2' => "two",
                '3' => "three",
                '4' => "four",
                '5' => "five",
                '6' => "six",
                '7' => "seven",
                '8' => "eight",
                '9' => "nine",
                '0' => "" }
tens_words = {'10' => "ten",
              '11' => "eleven",
              '12' => "twelve",
              '13' => "thirteen",
              '14' => "fourteen",
              '15' => "fifteen",
              '16' => "sixteen",
              '17' => "seventeen",
              '18' => "eighteen",
              '19' => "nineteen",
              '2' => "twenty",
              '3' => "thirty",
              '4' => "forty",
              '5' => "fifty",
              '6' => "sixty",
              '7' => "seventy",
              '8' => "eighty",
              '9' => "ninety",
              '0' => ""}

  string_number = number.to_s
  length = string_number.length
  result = ""

  if length == 3
    result = ones_words[string_number[0]] + " hundred " + two_digit_to_words(string_number[1..-1].to_i)
  elsif length == 2
    result = two_digit_to_words(number)
  else
    result = ones_words[string_number[0]]
  end
  result.strip.squeeze(" ")
end

def two_digit_to_words(number)
  ones_words = {'1' => "one",
                '2' => "two",
                '3' => "three",
                '4' => "four",
                '5' => "five",
                '6' => "six",
                '7' => "seven",
                '8' => "eight",
                '9' => "nine",
                '0' => "" }
  tens_words = {'10' => "ten",
              '11' => "eleven",
              '12' => "twelve",
              '13' => "thirteen",
              '14' => "fourteen",
              '15' => "fifteen",
              '16' => "sixteen",
              '17' => "seventeen",
              '18' => "eighteen",
              '19' => "nineteen",
              '2' => "twenty",
              '3' => "thirty",
              '4' => "forty",
              '5' => "fifty",
              '6' => "sixty",
              '7' => "seventy",
              '8' => "eighty",
              '9' => "ninety",
              '0' => ""}

  string_number = number.to_s
  result = ""

  if !tens_words.include?(string_number)
    result = tens_words[string_number[0]] + " " + ones_words[string_number[1]]
  elsif number < 10
    result = ones_words[string_number]
  else
    result = tens_words[string_number]
  end
  result.strip.squeeze(" ")
end
