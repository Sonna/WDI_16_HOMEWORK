---
source:
- title: WDI Spiner Warmup Solution
  url: https://gist.github.com/kasun-maldeni/df34ad18c7cabfabd597fc5f6736b0b9
---

# Spiner Warmup Solution

### JavaScript

```javascript
var spiner = function(str) {
  return str.toLowerCase().replace(/[\W_]+/g, '-')
};
```

### Ruby

```ruby
def spiner(str)
  str.downcase.gsub(/[\W_]+/, '-')
end
```
