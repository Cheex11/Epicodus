require('rspec')
require('word_calculator.rb')

describe('calculator') do 
  it('returns 2 when given the string "What is 1 plus 1"') do
    calculator("What is 1 plus 1?").should(eq("2.0"))
  end
end

describe('calculator') do
  it('returns 5 when given the string "What is 5 plus 0?') do
    calculator("What is 5 plus 0 plus 5?").should(eq("10.0"))
  end
end

describe('calculator') do
  it('returns 6 when asked, "What is 2 times 3?') do
    calculator("What is 2 times 3?").should(eq("6.0"))
  end
end

describe('calculator') do
  it('returns 522 when asked, "What is 500 times 2 minus 478?') do
    calculator("What is 2 times 3?").should(eq("6.0"))
  end
end

describe('calculator') do
  it('returns 6 when asked, "What is 12 divided by 2?') do
    calculator("What is 12 divided by 2?").should(eq("6.0"))
  end
end

describe('calculator') do
  it('returns 18 when given the string "What is 4 plus 4 plus 4 plus 4 plus 1 minus 6 plus 8 times 1 plus 10 divided by 3 times 6?') do
    calculator("What is 4 plus 4 plus 4 plus 4 plus 1 minus 6 plus 8 times 1 plus 10 divided by 3 times 6?").should(eq("39.0"))
  end
end

describe('calculator') do
  it('returns a float when asked what is 5 divided by 2?') do
    calculator("What is 5 divided by 2?").should(eq("2.5"))
  end
end

describe('calculator') do
  it('returns a float when given a question with decimals.') do
    calculator("What is 2.4589 plus 2.341111?").should(eq("4.800011"))
  end
end

describe('calculator') do
  it('returns the answer to two questions at the SAME TIME!!') do
    calculator("What is 5 plus 5?  What is 3 plus 2 minus 3 times 8?").should(eq("10.0,-19.0"))
  end
end

describe('calculator') do
  it('returns the answer to a power question using third etc') do
    calculator("What is 2 to the tenth power").should(eq("1024.0"))
  end
end

describe('calculator') do
  it('returns an error message when 0 is divided') do
    calculator("What is 2 divided by 0?").should(eq("Can't divide by zero!"))
  end
end
