function anagram(wordOne, wordList) {
  
  var wordListArray = wordList.split(" ");
  var trueArray = [];
  var falseArray = [];

  for (var i = 0; i < wordListArray.length; i++) {
    var wordTwo = wordListArray[i];

    var wordOneArray = wordOne.split("");
    var wordTwoArray = wordTwo.split("");

    wordOneArray = wordOneArray.sort();
    wordTwoArray = wordTwoArray.sort();

    if (shortAnagramTwo(wordOneArray, wordTwoArray) || (wordOneArray.join() === wordTwoArray.join())) {
      trueArray.push(wordListArray[i]);
    } else {
      falseArray.push(wordListArray[i]);
    }
  }

  var resultArray = [];

  resultArray[0] = trueArray.join(", ");
  resultArray[1] = falseArray.join(", ");

  return resultArray;
}

function shortAnagram(wordOneArray, wordTwoArray) {

  var isAnagram = false;

  for (var i = 0; i < wordTwoArray.length; i++) {
    if (wordOneArray.indexOf(wordTwoArray[i]) > -1) {
      isAnagram = true;
    } else {
      isAnagram = false;
      return isAnagram;
    }
  }
  return isAnagram;
}

function shortAnagramTwo(wordOneArray, wordTwoArray) {

  var isAnagram = false;

  if (wordTwoArray.length < wordOneArray.length) {
    wordTwoArray.forEach(function(letter) {
      if (wordOneArray.indexOf(letter) > -1) {
        if (verifyForDuplicates(wordOneArray, wordTwoArray) {
        isAnagram = true;
      } else {
        isAnagram = false;
        return isAnagram;
      }

      } else {
        isAnagram = false;
        return isAnagram;
      }
    });
  }
  return isAnagram;
}

function verifyForDuplicates(wordOneArray, wordTwoArray) {

var wordOne = wordOneArray.join();
var wordTwo = wordTwoArray.join();

wordTwoArray.forEach(function(letter) {
  if(wordOne.charAt(0) !== wordTwo.charAt(0)) {
    wordOne = wordOne.slice(0);
  }
});

  
}

$(document).ready(function() {
  $("form#anagramWords").submit(function(event) {
    var wordOne = $("input#wordOne").val();
    var wordList = $("input#wordList").val();
    var result = anagram(wordOne, wordList);

    $(".wordOne").text(wordOne);
    $(".anagramResults").text(result[0]);
    $(".notAnagramResults").text(result[1]);

    $("#result").show();
    event.preventDefault();
  });
});
