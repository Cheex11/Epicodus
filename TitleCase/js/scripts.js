function titleCase(title) {

  var titleArray = title.split(" ");
  var upperTitle = "";
  var restrictedArray = ["The", "And", "An", "A", "But", "Or", "Nor", "If"];

  for (var i = 0; i < titleArray.length; i++) {
    titleArray[i] = titleArray[i].charAt(0).toUpperCase() + titleArray[i].slice(1).toLowerCase();

    if (i > 0) {
      if (restrictedArray.indexOf(titleArray[i]) > -1) {
          titleArray[i] = titleArray[i].toLowerCase();
      }
    } 
  }

  upperTitle = titleArray.join(" ");

  return upperTitle;
}


$(document).ready(function() {
  $("form#titleCase").submit(function(event) {
    var title = $("input#title").val();
    var result = titleCase(title);

    $(".newTitle").text(result);

    $("#result").show();
    event.preventDefault();
  });
});
