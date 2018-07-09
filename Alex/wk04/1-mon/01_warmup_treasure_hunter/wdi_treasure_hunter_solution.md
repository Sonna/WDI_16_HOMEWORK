---
source:
- title: WDI Treasure Hunter Solution
  url: https://gist.github.com/kasun-maldeni/ad1d782edc9303ac325c5caf0d3ce197
---

```javascript
var holyGrailMap = [
["v","v","V","v","S","S"],
["v","v","V","v","S","S"],
["v","v","V","v","S","S"],
["v","v","V","v","S","S"],
["v","v","G","v","S","G"],
["v","v","H","v","S","S"],
["v","v","V","v","S","S"],
["A","V","A","A","A","S"]
];

function findTreasure(treasureMap, key) {
    return treasureMap.reduce(function(a, row, index) {
        if (a.length > 2) {
            a = 'That doesnt belong in a museum'
            return a;
        }
        if (row.filter(function(v) { return v === key }).length === 1) {
            a.push(index);
            a.push(row.indexOf(key));
        }
        return a;
    }, []);
}

console.log(findTreasure(holyGrailMap, 'G'));
```
