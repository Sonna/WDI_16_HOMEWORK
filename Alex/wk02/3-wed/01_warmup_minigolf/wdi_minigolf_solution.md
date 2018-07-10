---
source:
- title: WDI Minigolf Solution
  url: https://gist.github.com/kasun-maldeni/8e37cc1bd0fac4b085b219fb9baf702e
---

# JavaScript Solution:

### Core exercise
```javascript
var scoreBob = [3, 2, 6, 11, 9, 2, 6, 9, 10];
var scoreJimbo = [5, 12, 9, 22, 13, 7, 16, 10, 11];
var scoreFish = [2, 2, 4, 5, 4, 3, 6, 4, 1];

var totalScore = function(scores) {
  var total = 0;
  for (var i = 0; i < 9; i++) {
    total += scores[i];
  }
  return total;
};

var totalBob = totalScore(scoreBob);
var totalJimbo = totalScore(scoreJimbo);
var totalFish = totalScore(scoreFish);
console.log('Bob: ' + totalBob);
console.log('Jimbo: ' + totalJimbo);
console.log('Fish: ' + totalFish);
console.log('Total combined: ' + (totalBob + totalJimbo + totalFish));
```

### Extension
```javascript
var scorePar = [3, 4, 5, 5, 3, 3, 4, 3, 5];
var totalPar = totalScore(scorePar);

var bobOverPar = totalBob - totalPar;
var jimboOverPar = totalJimbo - totalPar;
var fishOverPar = totalFish - totalPar;
console.log('Bob strokes over par: ' + bobOverPar);
console.log('Jimbo strokes over par: ' + jimboOverPar);
console.log('Fish strokes over par: ' + fishOverPar);

var earningsFish = bobOverPar + jimboOverPar;
console.log('Fish earnings: $' + earningsFish);
```
