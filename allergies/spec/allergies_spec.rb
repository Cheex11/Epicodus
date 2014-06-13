require('rspec')
require('allergies')

describe('allergies') do 
  it('will return eggs if 1 is inputted') do
    allergies(128).should(eq(['cats']))
  end
  it('will return eggs if 1 is inputted') do
    allergies(2).should(eq(['peanuts']))
  end
  it('will return cats, pollen, chocolate, shellfish, peanuts, eggs') do
    allergies(231).should(eq(['cats', 'pollen', 'chocolate', 'shellfish', 'peanuts', 'eggs']))
  end
end
