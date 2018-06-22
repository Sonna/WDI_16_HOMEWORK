var module = QUnit.module;
var test = QUnit.test;

QUnit.test("hello test", function(assert) {
  assert.ok( 1 == "1", "Passed!" );
});

module("App", function(hooks) {
  test("Alamein train Line has expected values", function(assert) {
    assert.ok(alameinLine.some((line) => [
      "Flinders Street",
      "Richmond",
      "East Richmond",
      "Burnley",
      "Hawthorn",
      "Glenferrie"
    ].includes(line)));
  });

  test("Glen Waverly train Line has expected values", function(assert) {
    assert.ok(glenWaverlyLine.some((line) => [
      "Flagstaff",
      "Melbourne Central",
      "Parliament",
      "Richmond",
      "Kooyong",
      "Tooronga"
    ].includes(line)));
  });

  test("Sandringham train Line has expected values", function(assert) {
    assert.ok(sandringhamLine.some((line) => [
      "Southern Cross",
      "Richmond",
      "South Yarra",
      "Prahran",
      "Windsor"
    ].includes(line)));
  });

  test("findLine can returns Alamein train Line when given 'Hawthorn' station" +
       ", but no train lines are given", function(assert) {
    assert.deepEqual(findLine('Hawthorn'), alameinLine);
  });

  test("findLine can returns Alamein train Line when given 'Hawthorn' station",
       function(assert) {
    assert.deepEqual(findLine('Hawthorn', alltrainLines), alameinLine);
  });

  test("findLine can returns Glen Waverly Line when given 'Flagstaff' station",
       function(assert) {
    assert.deepEqual(findLine('Flagstaff', alltrainLines), glenWaverlyLine);
  });

  test("findLine can returns Sandringham Line when given 'Prahran' station",
       function(assert) {
    assert.deepEqual(findLine('Prahran', alltrainLines), sandringhamLine);
  });

  test("calculateJourney returns array of stations when travelling " +
       "from 'Southern Cross' to 'Kooyong'",
       function(assert) {
    assert.deepEqual(calculateJourney('Southern Cross', 'Kooyong'), [
      "Southern Cross",
      "Richmond",
      "Kooyong"
    ]);
  });

  test("calculateJourney returns array of stations when travelling " +
       "from 'Flagstaff' to 'Glenferrie'",
       function(assert) {
    assert.deepEqual(calculateJourney('Flagstaff', 'Glenferrie'), [
      "Flagstaff",
      "Melbourne Central",
      "Parliament",
      "Richmond",
      "East Richmond",
      "Burnley",
      "Hawthorn",
      "Glenferrie"
    ]);
  });

  test("calculateJourney returns array of stations when travelling " +
       "from 'Flinders Street' to 'South Yarra'",
       function(assert) {
    assert.deepEqual(calculateJourney('Flinders Street', 'South Yarra'), [
      "Flinders Street",
      "Richmond",
      "South Yarra"
    ]);
  });

  test("calculateJourney returns array of stations when travelling " +
       "from 'Burnley' to 'Melbourne Central'",
       function(assert) {
    assert.deepEqual(calculateJourney('Burnley', 'Melbourne Central'), [
      "Burnley",
      "East Richmond",
      "Richmond",
      "Parliament",
      "Melbourne Central"
    ]);
  });

  test("calculateJourney returns array of stations when travelling " +
       "from 'Tooronga' to 'Windsor'",
       function(assert) {
    assert.deepEqual(calculateJourney('Tooronga', 'Windsor'), [
      "Tooronga",
      "Kooyong",
      "Richmond",
      "South Yarra",
      "Prahran",
      "Windsor"
    ]);
  });

  test("calculateJourney returns array of stations when travelling " +
       "from 'Melbourne Central' to 'Richmond'",
       function(assert) {
    assert.deepEqual(calculateJourney('Melbourne Central', 'Richmond'), [
      "Melbourne Central",
      "Parliament",
      "Richmond"
    ]);
  });

  test("get journeyDetails when travelling " +
       "from 'Melbourne Central' to 'Richmond'",
       function(assert) {
    assert.equal(
      journeyDetails('Melbourne Central', 'Richmond'),
      'origin: Melbourne Central' + '\n' +
      'destination: Richmond' + '\n' +
      '\n' +
      'Melbourne Central -----> Parliament -----> Richmond' + '\n' +
      '\n' +
      '2 stops total'
    );
  });

  test("get journeyDetails when travelling " +
       "from 'East Richmond' to 'Flagstaff'",
       function(assert) {
    assert.equal(
      journeyDetails('East Richmond', 'Flagstaff'),
      'origin: East Richmond' + '\n' +
      'destination: Flagstaff' + '\n' +
      '\n' +
      'East Richmond -----> Richmond -----> ' +
      'Parliament -----> Melbourne Central -----> Flagstaff' + '\n' +
      '\n' +
      '4 stops total'
    );
  });
});


// == References:
// - [QUnit]
//   (http://qunitjs.com/)
//
// - [Introduction - Testing - Ember Guides]
//   (https://guides.emberjs.com/release/testing/)
