describe("anagram", function() {
  it("is false when two words do not contain exactly the same letters", function() {
    anagram("dice", "frog").should.eql(["","frog"]);
  });

  it("is true for two words that contain the same letters", function() {
    anagram("words","sword").should.eql(["sword",""]);
  });

  it("returns a list of valid anagrams", function() {
    anagram("words","sword wsord").should.eql(["sword, wsord",""]);
  });

  it("returns a list of non-anagrams", function() {
    anagram("words", "sword ice fun").should.eql(["sword","ice, fun"]);
  });

  it("is an anagram if all letters used in the second word are in the original word", function() {
    anagram("words", "sor woods").should.eql(["sor","woods"]);
  });
});
