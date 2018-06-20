// ---
// source:
// - title: guess.md
//   url: https://gist.github.com/epoch/c05113c6b3666711c773#file-guess-md
// ---

// # Title: Guess The Number
var maximumValue = -1;

while (maximumValue < 0 || maximumValue > 10000) {
  maximumValue = prompt(
    "Please choose a maximum value, between 0 and 10000", -1
  );
}

// ### Activity:
// - You are to generate a basic "guess my number" game.  The computer will pick
//   a random number between 0 and 10.  The user will guess the number until
//   they guess correctly.
var randomNumber = Math.floor((Math.random() * maximumValue) + 1);
var guess = prompt(
  "Please guess the random number between 1 and " + maximumValue,
  -1
);

// ### Specification:
while (guess != randomNumber) {
// - The user should be asked to guess a number

  if (guess < randomNumber) {
    guess = prompt(
      "Wrong, guess higher!\n" +
      "Please guess the random number between 1 and " + maximumValue,
      -1
    );
  } else if (guess > randomNumber) {
    guess = prompt(
      "Wrong, guess lower!\n" +
      "Please guess the random number between 1 and " + maximumValue,
      -1
    );
  } else {
    guess = prompt(
      "Please guess the random number between 1 and " + maximumValue,
      -1
    );
  }

// - If the user's guess is correct, the user should see a congratulatory
//   message
  if (guess == randomNumber) {
    console.log("obligatory congratulatory message");
  }
// - If the user's guess is not correct, the user should be asked to guess the
//   number again.
  else {
    console.log("Your guess was incorrect");


// ### Extensions:
// - Let the user choose the maximum value (so they can play a long game with a
//   random value between 0 and 10000, for example).
// - Give feedback to the user: "Wrong, guess higher!" or "Wrong, guess lower!"
    // (guess < randomNumber) && console.log("Wrong, guess higher!");
    // (guess > randomNumber) && console.log("Wrong, guess lower!");
  }
}

// == References:
// - [JavaScript random Method]
//   (https://www.w3schools.com/jsref/jsref_random.asp)
