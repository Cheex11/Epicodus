def translator(word)
  vowels = ['a', 'e', 'i', 'o', 'u']
  for i in 0..word.length
    if vowels.include?(word[0]) == true
      return word + 'ay'
    else 
      if word[0] == 'q' && word[1] == 'u'
        word = word[2..-1] + word[0..1]
      elsif word[0] == 'y' && i > 0
        return word + 'ay'
      else
        word = word[1..-1] + word[0]
      end
    end
  end
end

def sentence_translator(input)
  input = input.downcase
  sentence = input.split(" ")

  sentence.collect! do |word|
    translator(word)
  end

  sentence.join(" ")
end


