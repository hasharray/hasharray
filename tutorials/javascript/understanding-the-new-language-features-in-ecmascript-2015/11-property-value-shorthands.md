---
layout: page
title: Property Value Shorthands
---

Property Value Shorthand is a shorthand syntax object initializers whose
property keys are initialized by variables of the same name, whereas before we
would have to repeat the property key and variable name.

```javascript
function f( x, y ) {
return { x: x, y: y };
}
```

We can now leave out the redundant repetition entirely 

```javascript
function f( x, y ) {
return { x, y };
}
```

