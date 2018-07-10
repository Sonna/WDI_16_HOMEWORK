---
source:
- title: WDI Map Faker Solution
  url: https://gist.github.com/kasun-maldeni/fbe334cebd04cc0cbf241b0264b072e7
---

```javascript
function makeFakeMap(x, y, key) {
  var boundingMap = [];
  for(var i = 0; i < x; i++) {
    var line = "A".repeat(y).split('');
    boundingMap.push(line);
  }

  var randomX = Math.floor(Math.random() * (x + 1));
  var randomY = Math.floor(Math.random() * (y + 1));

  boundingMap[randomX][randomY] = key;
  return boundingMap;
}

makeFakeMap(10, 10, 'X');

//output

[ [ 'X', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ],
  [ 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A', 'A' ] ]
```
