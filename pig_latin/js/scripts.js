var toPigLatin = function(word) {
  var consonantSequence = '';
  var initialVowelIndex;
  var wordInPigLatin = '';

  var letters = word.toLowerCase().split('');

  for (var i = 0; i < letters.length; i++) {
    if (letters[i] === 'u' && consonantSequence.charAt(consonantSequence.length-1) === 'q') {
      consonantSequence += letters[i];
      continue;
    }
    if (isVowel(letters[i])) {
      initialVowelIndex = i;
      break;
    } else if (letters[i] === 'y' && i > 0) {
      initialVowelIndex = i;
      break;
    }
    consonantSequence += letters[i];
  }

  wordInPigLatin += letters.slice(initialVowelIndex).join('');
  wordInPigLatin += consonantSequence;
  wordInPigLatin += 'ay';

  return wordInPL;
};

var isVowel = function(character) {
  var vowels = ['a', 'e', 'i', 'o', 'u'];
  var lowerCaseLetter = character.toLowerCase();

  return (vowels.indexOf(lowerCaseLetter) >= 0 ? true : false);
};

var pigLatinSentence = function(sentence) {
  var initialWords = sentence.split(' ');
  var pigLatinWords = [];

  initialWords.forEach(function (word) {
    pigLatinWords.push(toPigLatin(word));
  });

  var unformatted = pigLatinWords.join(" ");
  return unformatted.charAt(0).toUpperCase() + unformatted.substr(1);
};

$(document).ready(function() {
  $("form#pig-latin").submit(function(event) {
    var sentence = $("input#sentence").val();
    var result = pigLatinSentence(sentence);

    $(".pigLatinSentence").text(result);
    

    $("#result").show();
    event.preventDefault();
  });
});
