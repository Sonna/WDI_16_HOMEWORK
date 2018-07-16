// ---
// source:
// - title: WDI Spiner Warmup
//   url: https://gist.github.com/kasun-maldeni/df34ad18c7cabfabd597fc5f6736b0b9
// ---

// # Finish Him!

// In JavaScript, write a function 'spiner' that takes a string as an argument
// and returns the string as all lowercase words joined by dashes. Your function
// should account for upper/lower case inputs, as well as sentences __not__
// seperated by spaces.

function spiner(sentence) {
  return sentence.toLowerCase().replace(/[^a-z]/gi, "-");
}

// ```javascript
spiner("All Lowercase Words Joined By Dashes") // --> "all-lowercase-words-joined-by-dashes"
console.log(spiner("All Lowercase Words Joined By Dashes"));

spiner("The_Andy_Griffith_Show") // --> "the-andy-griffith-show"
console.log(spiner("The_Andy_Griffith_Show"));
// ```
