var module = QUnit.module;
var test = QUnit.test;

QUnit.test("hello test", function(assert) {
  assert.ok( 1 == "1", "Passed!" );
});

module("App", function(hooks) {
  test("Alamein train Line has expected values", function(assert) {
    assert.deepEqual(alameinLine, [
      "Flinders Street",
      "Richmond",
      "East Richmond",
      "Burnley",
      "Hawthorn",
      "Glenferrie"
    ]);
  });

  test("Glen Waverly train Line has expected values", function(assert) {
    assert.deepEqual(glenWaverlyLine, [
      "Flagstaff",
      "Melbourne Central",
      "Parliament",
      "Richmond",
      "Kooyong",
      "Tooronga"
    ]);
  });

  test("Sandringham train Line has expected values", function(assert) {
    assert.deepEqual(sandringhamLine, [
      "Southern Cross",
      "Richmond",
      "South Yarra",
      "Prahran",
      "Windsor"
    ]);
  });

  test("findLine can returns Alamein train Line when given 'Hawthorn' station",
       function(assert) {
    assert.deepEqual(findLine('Hawthorn'), alameinLine);
  });

  test("findLine can returns Glen Waverly Line when given 'Flagstaff' station",
       function(assert) {
    assert.deepEqual(findLine('Flagstaff'), glenWaverlyLine);
  });

  test("findLine can returns Sandringham Line when given 'Prahran' station",
       function(assert) {
    assert.deepEqual(findLine('Prahran'), sandringhamLine);
  });
});


// == References:
// - [QUnit]
//   (http://qunitjs.com/)
//
// - [Introduction - Testing - Ember Guides]
//   (https://guides.emberjs.com/release/testing/)
