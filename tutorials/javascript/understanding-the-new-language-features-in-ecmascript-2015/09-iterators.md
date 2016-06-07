---
layout: page
title: Iterators
---

## Iterators

We can use iterators to iterate over arbitrary objects, while this by itself is
not strictly a language feature, rather a protocol/pattern that is implemented
by the core library, it does tie into other language features such as
generators and for-for which work with this pattern.

The iterator protocol takes the following form, any object can be an iterator
as long as it defines a `next()` method.

Any object can be iterable as long as it defines an iterator method, the named
of the method is obtained through `Symbol.iterator`, often denoted with
`@@iterator`.

```javascript
function RangeIterator(min, max) {
this[Symbol.iterator] = function () {
var current = min;

return {
next: function () {
current++;

return {
done: current == max,
value: current,
};
}
}
};
}
```

