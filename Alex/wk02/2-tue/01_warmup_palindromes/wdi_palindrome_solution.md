---
source:
- title: WDI Palindrome Solution
  url: https://gist.github.com/kasun-maldeni/30b3e92ffef58201dab1c3e26332ed97
---

```javascript
function palindrome(str) {
  var stripped = str.toLowerCase().replace(/[\W_]/g, '');
  var reversed = stripped.split('').reverse().join('');
  return reversed == stripped;
}
```
