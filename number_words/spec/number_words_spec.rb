require('rspec')
require('number_words')

describe('number_words') do
  it('should return properly for a one-digit number') do
    number_words(8).should(eq("eight"))
  end
  it('should return properly for a two-digit number less than 20') do
    number_words(17).should(eq("seventeen"))
  end
  it('should return properly for a two-digit number greater than 19') do
    number_words(34).should(eq("thirty four"))
  end
  it('should return properly for a three digit number') do
    number_words(630).should(eq("six hundred thirty"))
  end
  it('should return properly for a four digit number') do
    number_words(7630).should(eq("seven thousand six hundred thirty"))
  end
  it('should return properly for a four digit number') do
    number_words(41027630).should(eq("forty one million twenty seven thousand six hundred thirty"))
  end
end
