---
source:
- title: WDI Proximity Solution
  url: https://gist.github.com/kasun-maldeni/88cb244feaf3b6229f465f58481a6c06
---


```javascript
var startPoint = {name: "General Assembly", location: {lat: -37.818555, long: 144.959076}}
var results = [
  {name: "Melbourne Cricket Grounds", location: {lat: -37.819967, long: 144.983449}},
  {name: "Flagstaff Gardens", location: {lat: -37.810680, long: 144.954352}},
  {name: "Emporium Melbourne", location: {lat: -37.812433, long: 144.963787}},
  {name: "City Library", location: {lat: -37.817039, long: 144.965983}},
  {name: "Southern Cross Station", location: {lat: -37.818281, long: 144.952776}},
  {name: "Sea Life Melbourne Aquarium", location: {lat: -37.820640, long: 144.958325}}
]

results.map(function(res) {
  var latDiff = startPoint.location.lat - res.location.lat
  var longDiff = startPoint.location.long - res.location.long
  var dist = Math.sqrt(latDiff ** 2 + longDiff ** 2)
  return {name: res.name, dist: dist}
}).sort(function(res1, res2) {
  return res1.dist > res2.dist
}).forEach(function(result) {
  console.log(result.name)
})
```
