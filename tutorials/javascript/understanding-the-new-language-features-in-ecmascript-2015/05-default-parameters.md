---
layout: page
title: Default Parameters 
---

## Default Parameter Values

We can use default parameter values to initialize parameters when they were not explicitly provided.
Where-as previously we would often check for undefined and assign default values.

```javascript
function f(x, y) {
y = y || 42;
return x + y;
}
```

We can now simply inline that information in the function parameters.

```javascript
function f(x, y=42) {
return x + y;
}
```

Default values are only evaluated *if* no value is provided, meaning it's fine
to use functions to provide the default value.

```javascript
function createSocket() {
return new Socket();
}

function use(socket=createSocket()) {
}
```

