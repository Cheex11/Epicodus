require('rspec')
require('binary_converter.rb')

# describe('decimal_to_binary_converter') do 
#   it('when given 2, it returns 10') do
#     decimal_to_binary_converter(2).should(eq("10"))
#   end
# end

# describe('binary_to_decimal_converter') do 
#   it('when given 10, it returns 2') do
#     binary_to_decimal_converter(10).should(eq("2"))
#   end
# end

describe('binary_to_decimal_converter') do 
  it('when given 16, it returns 10000') do
    binary_to_decimal_converter(10000).should(eq("16"))
  end
end



describe('binary_to_decimal_converter') do 
  it('when given 534, it returns 1000010110') do
    binary_to_decimal_converter(1000010110).should(eq("534"))
  end
end
