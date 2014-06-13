function triangles(x,y,z) {

var sidesArray = [x, y, z];

    sidesArray = sidesArray.sort(function(a,b){return b-a});

    if ((sidesArray[2] + sidesArray[1]) >= sidesArray[0]) {
        if (x === y && y === z) {
            return "equilateral";  
        }   else if(x === y || y === z || x === z) {
            return "isosceles";
        }   else {
            return "scalene";
        }
    }   else {
        return "Please enter a real triangle";
    }
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
