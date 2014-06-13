describe('leapYear', function() {
  it("is false for a year that is not divisible by 4", function() {
    leapYear(1999).should.equal(false);
  });

  it("is true for most years divisible by 4", function() {
    leapYear(2012).should.equal(true);
  });

  it("is false for most years divisible by 100", function() {
    leapYear(1900).should.equal(false);
  });
});
