require ('rspec')
require ('piglatin')

describe('translator') do 
  it('adds "ay" to the end of most word') do
    translator('apple').should(eq('appleay'))
  end
  it('adds "ay" to the end of a word that starts with a vowel') do
    translator('epicodus').should(eq('epicodusay'))
  end
  it('if the word starts with a consonant, the function moves the consonant to the end of the word and adds "ay"') do
    translator('task').should(eq('asktay'))
  end
  it('if the word starts with more than one consonant, the function moves the consonants to the end of the word and adds "ay"') do
    translator('cloud').should(eq('oudclay'))
  end
  it('if the word starts with a consonant and has a q before the first vowel, move the q and u with the rest of the consonants to the end of the word.') do
    translator('squire').should(eq('iresquay'))
  end
  it('should treat y as a consonant if it is the first letter and a vowel if it is not') do
    translator('yellow').should(eq('ellowyay'))
  end
  it('should treat y as a consonant if it is the first letter and a vowel if it is not') do
    translator('symbol').should(eq('ymbolsay'))
  end
end

describe('sentence_translator') do 
  it('translates sentences from english to piglatin') do
    sentence_translator('sentence is a terrible test').should(eq('entencesay isay aay erribletay esttay'))
  end
end


