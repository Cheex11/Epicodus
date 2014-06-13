def calculator(originalString)

  operators = {"plus" => :+,
              "minus" => :-,
              "divided" => :/,
              "times" => :*,
              "first" => [:**,1],
              "second" => [:**,2],
              "third" => [:**,3],
              "fourth" => [:**,4],
              "fifth" => [:**,5],
              "sixth" => [:**,6],
              "seventh" => [:**,7],
              "eighth" => [:**,8],
              "nineth" => [:**,9],
              "tenth" => [:**,10]} 

  questions=originalString.split("?")
  answer=[]
  calculations = []
  words = []

  questions.each do |question|
    words=question.split
      words.each do |word|
        if operators.include? word
            calculations.push(operators[word])
        elsif /[0-9]/.match(word) 
            calculations.push(word.to_f)
        else 
            calculations = calculations
        end
      end 
     answer.push(eval(calculations.join)) 
     calculations=[]
    end

  if answer == [1.0/0.0]
    "Can't divide by zero!"
  else 
    answer = answer.join(",")
  end
end
