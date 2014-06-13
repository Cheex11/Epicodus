require('rspec')
require('numbers_to_words')

describe('numbers_to_words') do
  it('returns the correct word for the single digit numbers') do
    numbers_to_words(7).should(eq("seven"))
  end
  it('returns the correct word for the teen numbers') do
    numbers_to_words(16).should(eq("sixteen"))
  end
  it('returns the correct word for the decades') do
    numbers_to_words(50).should(eq("fifty"))
  end
  it('returns the correct word for the decades') do
  numbers_to_words(21).should(eq("twenty one"))
  end
  it('returns the correct word for the decades') do
  numbers_to_words(87).should(eq("eighty seven"))
  end
  it('returns the correct word for round hundreds') do
    numbers_to_words(700).should(eq("seven hundred"))
  end
  it('returns the correct word for any three digit number') do
    numbers_to_words(705).should(eq("seven hundred five"))
  end
  it('returns the correct word for any three digit number') do
    numbers_to_words(735).should(eq("seven hundred thirty five"))
  end

end
