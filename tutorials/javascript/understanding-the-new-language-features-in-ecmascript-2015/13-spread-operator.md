---
layout: page
title: Spread Operator
---

The spread operator allows an expression to be expanded in places where
multiple arguments or multiple elements are expected.

```javascript
var a = [0, 1, 2];
var b = [3, 4, 5];

a.push(...b);
console.log(a.join(' '));
```

