var leapYear = function(year) {
  if (divisibleByFourHundred(year)) {
    return true;
  } else {
    if (divisibleByFour(year) && !divisibleByOneHundred(year)) {
      return true;
    } else {
      return false;
    }
  }  
};

var divisibleByFour = function(year) {
  if (year % 4 === 0) {
    return true;
  } else {
    return false;
  }
};

var divisibleByOneHundred = function(year) {
  if (year % 100 === 0) {
    return true;
  } else {  
    return false;
  }
};

var divisibleByFourHundred = function(year) {
  if (year % 400 === 0) {
    return true;
  } else {  
    return false;
  }
};

$(document).ready(function() {
  $("form#leap-year").submit(function(event) {
    var year = parseInt($("input#year").val());
      

      if (isNaN(year)) {
        alert("Please enter a number");
      }
    var result = leapYear(year);

    $(".year").text(year);
      if (!result) {
        $(".not").text("not");
      } else {
        $(".not").text("");
      }

      if (isNaN(year)) {
        $("#result").hide();
      } else {
        $("#result").show();
      }
    this.reset(); 
    event.preventDefault();

  });
});
