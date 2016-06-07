---
layout: page
title: Generators
---

Generators make it easy to create iterators. Instead of tracking state yourself
and implementing `iterator`, you just use yield (or yield* to yield each
element in an iterator).

```javascript
function *range(min, max) {
for (var i = min; i < max; i++) {
yield i;
}
}

for (let value of range(0, 100)) {
console.log(value);
}
```

We can use the `for-of` loop to conveniently loop over iterable objects.

```javascript
for (let i of new RangeIterator([1, 10])) {
console.log(i);
}
```
