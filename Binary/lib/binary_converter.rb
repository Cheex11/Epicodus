def decimal_to_binary_converter(decimal_num)
  #converts decimal number (base 10) to binary number (base 2)
  decimal_num.to_s(2)
end

def binary_to_decimal_converter(binary_num)
  number = binary_num.to_s
  digits = number.split("")
  answer = 0
 
 digits.reverse.each_with_index do |num, index|
  unless num  == "0" 
    answer += 2**index
  end
 end

 answer.to_s

end

