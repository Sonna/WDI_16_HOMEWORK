---
source:
- title: WDI Granny-Talk Solution
  url: https://gist.github.com/kasun-maldeni/5bf61960b86e4e9e8ba8d133a9265345
---

```javascript
var grannyTalk = function(message) {
  if (message === 'BYE') {
    return 'Whats that honey, I didnt hear you..';
  } else if (message === message.toUpperCase()){
    return 'NO, NOT SINCE' + Number(Math.floor(Math.random() * (1950 - 1930)) + 1930);
  } else {
    return 'SPEAK UP SONNY JIM';
  }
}

var grandpaTalk = function(message) {
  var askGran = grannyTalk(message);

  if (askGran.includes('NO,')) {
    return 'NO, NOT SINCE' + Number(Math.floor(Math.random() * (1950 - 1930)) + 1930);
  }

  var vowels = ['a','e','i','o','u'];

  return askGran.toLowerCase().split('').map(function(e) {
    return vowels.indexOf(e) !== -1 ? vowels[Math.floor(Math.random() * vowels.length)] : e;
  }).join('').toUpperCase();
}

console.log(grannyTalk('BYEEE'));
```
