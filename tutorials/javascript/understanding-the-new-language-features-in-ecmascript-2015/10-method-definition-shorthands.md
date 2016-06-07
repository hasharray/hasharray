---
layout: page
title: Generators
---

Method Definition Shorthand is a shorthand syntax for method definitions in
object initializers, whereas before we would explicitly state the property
name.

```javascript
var obj = {
toString: function toString() {
return 'obj';
};
};
```

We can now infer that from the function name itself

```javascript
obj = {
toString() {
return 'obj';
},
};
```

