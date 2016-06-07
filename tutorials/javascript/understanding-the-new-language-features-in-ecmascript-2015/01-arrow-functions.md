---
layout: page
title: Arrow Functions
---

Arrow functions provide us with a short hand syntax for writing functions with
the fat arrow notation `=>`. However, unlike regular functions, arrow functions
are bound to the lexical scope and share the same lexical `this` context as the
declaring code.

For example, previously with a normal function we would have to capture the
value of `this` if we needed to preserve it in lets say an event handler.

```javascript
var that = this;

setTimeout(function() {
  console.log(that.secret);
}, 1000);
```

Or in some cases, one might choose to use `Function#bind`

```javascript
setTimeout(function() {
  console.log(this.secret);
}.bind(this), 1000);
```

Using an arrow function we can now drop that completely.

```javascript
process.nextTick(() => {
  console.log(this.secret);
});
```

Having a function body for an arrow function is also optional, it may also be in the
form of an an expression so we can make that previous example even more concise.

```javascript
setTimeout(() => console.log(this.message), 1000);
```

The parenthisis is also optional when there is single argument passed to the
function, which makes one liners quite simple to do.

```javascript
[1, 2, 3].map(n => n - 1); // => 0, 1, 2
```

