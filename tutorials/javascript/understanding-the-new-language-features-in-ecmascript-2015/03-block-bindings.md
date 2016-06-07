---
layout: page
title: Block Bindings
---

Block scoping give us new forms of declaration for defining variables scoped to
a single block, as opposed to variables declared with `var` which give us
a function-level scope.

### Let

We can use let in-place of var to define block-local variables without having
to worry about them clashing with variables defined elsewhere within the same
function body.

```javascript
for (var i = 0; i < 3; i++) {
let j = i * i;
console.log(j);
}

console.log(j); // => error, j is undefined
```

### Const

`const` follows the same rules as `let`, except that the value is immutable so
we can only assign to it once.

```javascript
const PI = 3.14159265359;
PI = 0; // => Error: PI" is read-only
```

Note that only the identifier is immutable, meaning if its an object, the
properties of the object can still be mutated.

