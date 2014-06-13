describe("titleCase", function() {
  it("always starts with a capital letter.", function() {
    titleCase("w").should.equal("W");
  });

  it("usually capitalizes only the first letter in any word", function() {
    titleCase("war").should.equal("War");
  });

  it("applies these rules to each word in a title", function() {
    titleCase("war peace").should.equal("War Peace");
  });

  it("does not capitalize the following words: the, and, an, a, but, or, nor, if", function() {
    titleCase("war and peace").should.equal("War and Peace");
  });

  it("Non first letters are never capitalized", function() {
    titleCase("WaR AnD PeaCE").should.equal("War and Peace");
  });

  it("will capitalize an 'exception' word if that word is the first in the title", function() {
    titleCase("a knights tale").should.equal("A Knights Tale");
  });

});
