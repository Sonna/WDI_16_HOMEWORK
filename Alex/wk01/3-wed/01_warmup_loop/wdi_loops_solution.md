---
source:
- title: WDI Loops Solution
  url: https://gist.github.com/kasun-maldeni/d13b6338029c4a35c0b2f6ee91b92dd0/
---

# Loops Warmup Solution

### Leap Years
```javascript
var currentYear = new Date().getFullYear()
var yearRange = 100
for(var year = currentYear - yearRange; year < currentYear; year++) {
  if (year % 4 === 0 && !(year % 100 === 0 && !(year % 400 === 0))) {
    console.log(year);
  }
}
```

### Multiples of 7 and every second odd number
```javascript
for (var num = 1; num < 200; num++) {
  if (num % 7 === 0 || num % 4 === 3) {
    console.log(num);
  }
}
```

### Prime Numbers
```javascript
function isPrime(num) {
  for (var i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function getPrimes(final) {
  var primes = [2];
  for (var num = 3; num < final; num+=2) {
    if (isPrime(num)) {
      primes.push(num);
    }
  }
  return primes;
}

var primes = getPrimes(200);
console.log(primes.join(', '));
```
