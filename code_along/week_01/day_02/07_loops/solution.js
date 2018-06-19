// ---
// source:
// - title: js_week1_loops.md
//   url: https://gist.github.com/epoch/0df5e2eeaadb8871b9a73887162c2ab4#file-js_week1_loops-md
// ---

// # The even/odd reporter

// Write a for loop that will iterate from 0 to 20. For each iteration, it will
// check if the current number is even or odd, and report that to the screen
// (e.g. "2 is even").
for (var i = 0; i < 21; i++) {
  if (i % 2 === 0) {
    console.log(i + " is even");
  } else {
    console.log(i + " is odd");
  }
}

// # Multiplication Tables

// Write a for loop that will iterate from 0 to 10. For each iteration of the
// for loop, it will multiply the number by 9 and log the result (e.g. "2 * 9 =
// 18").
for (var number = 0; number < 11; number++) {
  console.log(number + " * 9 = " + (9 * number));
}

// Bonus: Use a nested for loop to show the tables for every multiplier from 1
// to 10 (100 results total).
for (var a = 0; a < 11; a++) {
  for (var b = 0; b < 11; b++) {
    console.log(a + " * " + b + " = " + (a * b));
  }
}

// # Your top choices

// Create an array to hold your top choices (colors, presidents, whatever).
var colours = ["red", "green", "blue"]

// For each choice, log to the screen a string like: "My #1 choice is blue."
colours.forEach(function(colour, index) {
  console.log("My #" + (index + 1) + " choice is " + colour + ".");
});

// Bonus: Change it to log "My 1st choice, "My 2nd choice", "My 3rd choice",
// picking the right suffix for the number based on what it is.
