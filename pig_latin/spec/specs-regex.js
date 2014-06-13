describe('toPigLatin', function() {
  it('returns #__ay for #__ if # is a vowel', function() {
    toPigLatin('ax').should.equal('axay');
  });

  it('returns __#ay for #__ if # is a sequence of consonants', function() {
    toPigLatin('scrup').should.equal('upscray');
  });

  it('returns y__#ay for #y__ if #is a sequence of consonants', function() {
    toPigLatin('rythmn').should.equal('ythmnray');
  });

  it('returns __#uay for #u__ if # is a q', function() {
    toPigLatin('square').should.equal('aresquay');
  });

});

describe('pigLatinSentence', function() {
  it('turns words into Pig Latin words', function() {
    pigLatinSentence('Hello world').should.equal('Ellohay orldway');
  });

});
