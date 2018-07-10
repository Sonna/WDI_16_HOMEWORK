// ---
// source:
// - title: WDI Loops Warmup
//   url: https://gist.github.com/kasun-maldeni/de11a4038efd7d323cc572238ee53060
// - title: WDI Loops Solution
//   url: https://gist.github.com/kasun-maldeni/d13b6338029c4a35c0b2f6ee91b92dd0/
// ---

// # Loops Warmup
console.log("Print out all the leap years in the last 100 years.");

// 1. Print out all the leap years in the last 100 years.
var currentYear = new Date(Date.now()).getFullYear();

// The year can be evenly divided by 4;
// If the year can be evenly divided by 100, it is NOT a leap year, unless;
// The year is also evenly divisible by 400. Then it is a leap year.
for (var year = currentYear - 100; year < currentYear; year++) {
  if ((year % 4 === 0) && ((year % 100 !== 0) || (year % 400 === 0))) {
    console.log(year);
  }
}

console.log("For numbers between 1 and 200:");
console.log("a) print out multiples of 7.");
console.log("b) print out every second odd number.");
// 2. For numbers between 1 and 200:<br />
for (var num = 1; num < 200; num++) {
  // a) print out multiples of 7.<br />
  ((num % 7 === 0) ||
  // b) print out every second odd number.<br />
   (num % 4 === 3)) && console.log(num);
}

// ### Extension:
// Print out all prime numbers between 0 and 200.
console.log("Print out all prime numbers between 0 and 200.");
//
// Return whether x is prime or not
//
// Returns:
//   1  - prime
//   0  - not prime
//   -1 - undefined (i.e. x < 2)
//
function isPrime(x) {
  if (x < 2) { return -1; }
  if (x < 4) { return 1; }
  if ((x % 2) == 0) { return 0; }
  for (var i = 3; i <= Math.floor(Math.sqrt(x)); i += 2) {
    if ((x % i) == 0) {
      return 0;
    }
  }
  return 1;
}

//
// Return the next prime after x, or x if x is prime
//
// function nextPrime(x) {
//   while (isPrime(x) != 1) {
//     x++;
//   }
//   return x;
// }

for (var num = 0; num < 200; num++) {
  (isPrime(num) === 1) && console.log(num);
}
