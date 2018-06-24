// ---
// source:
// - title: WDI Granny-Talk Warmup
//   url: https://gist.github.com/kasun-maldeni/370b6193469f0cca3a0fdba135686499
// ---

// Write a function 'grannyTalk' what takes a question as an argument and
// returns a string as her response.

// If you talk to Granny normally, she'll reply "SPEAK UP SONNY JIM"

// If you talk to her in ALL CAPS, she'll reply "NO, NOT SINCE 1945"

// The year will be a random year between 1930 and 1950.

// If you say "BYE" to her she'll reply "What's that honey, I didn't hear you.."

var grannyTalk = function(question) {
  if (question.toUpperCase() === "BYE") {
    return "What's that honey, I didn't hear you..."
  }

  if (question.toUpperCase() === question) {
    var year = 1930 + Math.floor((Math.random() * 20));
    return "NO, NOT SINCE " + year;
  }

  return "SPEAK UP SONNY JIM";
};

console.log(grannyTalk('Yo'));
console.log(grannyTalk('HELLO'));
console.log(grannyTalk('bye'));

// bonus: write an additional function 'grandpaTalk' that when called, will call
// granny for you and interpret her responses incorrectly by swapping vowels
// randomly in the words of her responses.

// sample output of grandpaTalk:

// // NO, NOT SINCE __incorrect year__
// // whats that sunny

var randomVowel = function() {
  var vowels = ['a', 'e', 'i', 'o', 'u'];
  return vowels[Math.floor(Math.random() * vowels.length)];
};

var grandpaTalk = function(question) {
  // var vowels = ['a', 'e', 'i', 'o', 'u'];
  // var randomVowels = vowels.sort(function(a, b) { return 0.5 - Math.random() });
  return grannyTalk(question).replace(/[aeiou]/ig, function(_char) {
    return randomVowel();
  });
};

console.log(grandpaTalk('Yo'));
console.log(grandpaTalk('HELLO'));
console.log(grandpaTalk('bye'));

// == References:
// - [JavaScript Array Sort]
//   (https://www.w3schools.com/js/js_array_sort.asp)
//
// - [JavaScript String replace Method]
//   (https://www.w3schools.com/jsref/jsref_replace.asp)

