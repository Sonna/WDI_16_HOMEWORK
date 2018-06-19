// ---
// source:
// - title: js-1-vars.md
//   url: https://gist.github.com/epoch/5c2c42797947ffb413d0#file-js-1-vars-md
// ---

// # The Fortune Teller

// Why pay a fortune teller when you can just program your fortune yourself?

// Store the following into variables: number of children, partner's name,
// geographic location, job title. Output your fortune to the screen like so:
// "You will be a X in Y, and married to Z with N kids."
var numChildren = prompt("Please enter your number of children", 2);
var partnersName = prompt("Please enter your partner's name", "Work");
var geographicLocation = prompt("Please enter a location", "Melbourne, Australia");
var jobTitle = prompt("Please enter your job title", "Developer");

console.log(
  "You will be a " + jobTitle +
  " in " + geographicLocation +
  ", and married to " + partnersName +
  " with " + numChildren + " kids."
);

// # The Age Calculator

// Forgot how old someone is? Calculate it!

// - Store the current year in a variable.
var currentYear = new Date(Date.now()).getFullYear();

// - Store their birth year in a variable.
var birthYear = 1990;

// - Calculate their 2 possible ages based on the stored values.
var age1 = currentYear - birthYear;
var age2 = age1 - 1;

// - Output them to the screen like so: "They are either NN or NN", substituting
//   the values.
console.log("They are either " + age1 + " or " + age2);

// # The Lifetime Supply Calculator

// Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no
// more!

// - Store your current age into a variable.
var age = 27;

// - Store a maximum age into a variable.
var maximumAge = 100;

// - Store an estimated amount per day (as a number).
var amountPerDay = 3;

// - Calculate how many you would eat total for the rest of your life.
var daysInAYear = 364;

var total = (maximumAge - age) * amountPerDay * daysInAYear;

// - Output the result to the screen like so: "You will need NN to last you
//   until the ripe old age of X".
console.log(
  "You will need " + total +
  " to last you until the ripe old age of " + maximumAge
);
