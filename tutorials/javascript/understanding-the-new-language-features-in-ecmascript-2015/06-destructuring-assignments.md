---
layout: page
title: Destructuring Assignments
---

## Destructuring Assignments

Destructuring assignment allows us to assign parts of an object to several
variables at once.

So lets say we have a `ball`, the ball is defined as

```javascript
var ball = {
position: [0, 0],
radius: 20,
elasticity: 1,
deflated: false,
};
```

Before we had no choice but to extract each value with its own assignment

```javascript
var x = ball.position[0];
var y = ball.position[1];
var radius = ball.radius;
var elasticity = ball.elasticity;
var deflated = ball.deflated;
```

With destructuring, we can reduce this down to a single line.

```javascript
var [x, y] = ball.position;
var { radius, elasticity, deflated } = ball;
```

