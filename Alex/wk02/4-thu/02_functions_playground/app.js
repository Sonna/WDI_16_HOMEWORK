// var total = double(5) + 2;
// var total = doubleNumber(5) + 2;
// var total = doubleNum(5) + 2;
// var total = times2(5) + 2;
// var total = timesTwo(5) + 2;
// var total = timesByTwo(5) + 2;
// var total = multiplyByTwo(5) + 2;
var total = doubleNum(5) + 2 + doubleNum(3);

var ingredients = [];

var mixedIngredients = mix(ingredients);
var bakedCake = bake(mixedIngredients);
var product = package(bakedCake);

//

var product = package(bake(mix(ingredients)));

//

var peelBananas = function(listOfBananas) {
  // return listOfBananas.map((banana) => banana);
  // return listOfBananas.map(function(banana) { return banana; });
  var peeledBananas = [];
  for (var i = 0; i < listOfBananas.length; i++) {
    console.log('peeling banana at index ' + listOfBananas[i]);
    peeledBananas.push(listOfBananas[i]);
  }
  return peeledBananas;
};

var peelBananas = function(listOfBananas, shouldPeeledBanana) {
  var peeledBananas = [];
  for (var i = 0; i < listOfBananas.length; i++) {
    if (shouldPeeledBanana) {
      console.log('peeling banana at index ' + listOfBananas[i]);
    }
    peeledBananas.push(listOfBananas[i]);
  }
  return peeledBananas;
};

//

var peel = function(thing) {
  // some code here
  // returns peeledThing
  console.log('peeling ' + thing);
  return thing;
};

var crack = function(thing) {
  // some code here
  // returns crackedThing
  console.log('cracking ' + thing);
  return thing;
};

// var doSomethingToEachItem = function(list, func) {
// var doSomethingToEachItem = function(list, functionPassedIn) {
var doSomethingToEachItem = function(list, action) {
  var newList = [];
  for (var i = 0; i < list.length; i++) {
    // functionPassedIn(list[i]);
    // func(list[i]);
    newList.push( action(list[i]) );
  }
  return newList;
};

var listOfEggs = [{}, {}, {}];
doSomethingToEachItem(listOfEggs, crack);

//

var shout = function(word) {
  return word.toUpperCase();
};

shout('hello'); // => 'HELLO'
shout('hi'); // => 'HI'

var exclaim = function(word) {
  return word.toUpperCase() + '!';
};

exclaim('hello'); // => 'HELLO!'
exclaim('hi'); // => 'HI!'

var = pluralizeWord = function(word) {
  // work out how to pluralize a word
  return pluralizedWord;
};

var listOfWords = ['hello', 'hi', 'goodbye'];
exclaim(listOfWords[0]); // => 'HELLO!'
exclaim(listOfWords[1]); // => 'HI!'
exclaim(listOfWords[2]); // => 'GOODBYE!'

for (var i = 0; i < listOfWords.length; i++) {
  exclaim(listOfWords[i]);
}

listOfWords.map(exclaim);
// listOfWords.map(function(word) { return exclaim(word, n); } );
