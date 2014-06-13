describe("triangles", function() {
  it("is equilateral when all sides are the same length.", function() {
    triangles(2,2,2).should.equal("equilateral");
  });

  it("is isosceles when exactly two sides of the triangle are the same length", function() {
    triangles(3,3,5).should.equal("isosceles");
  });

  it("is isosceles when exactly two sides of the triangle are the same length", function() {
    triangles(4,12,3).should.equal("Please enter a real triangle");
  });
});
