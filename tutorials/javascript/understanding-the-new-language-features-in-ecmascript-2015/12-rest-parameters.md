---
layout: page
title: Rest Parameters
---

Rest parameters provides a cleaner way of dealing with variadic functions, that
is functions that take a arbitrary number of parameters.

```javascript
function add(...values) {
let sum = 0;

for (var val of values) {
sum += val;
}

return sum;
}

add(2, 5, 3); // => 10
```

