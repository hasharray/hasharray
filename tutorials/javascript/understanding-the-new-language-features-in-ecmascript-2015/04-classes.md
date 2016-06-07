---
layout: page
title: Classes
---

Classes give us a concise declarative syntax for writing object oriented
prototype patterns with a classical classes approach, the class syntax has
support for inheritance, super calls, instance and static properties and
constructors.

Without it, we would typically write a class like construct in the following
manner.

```javascript
var Monster = (function(Entity) {
function Monster(name) {
Entity.call(this);
this.name = name;
}

util.inherits(Monster, Entity);

Object.defineProperty(Monster.prototype, "scariness", {
get: function () {
return 'mild';
},
enumerable: true,
configurable: true
});

Monster.prototype.speak = function () {
Entity.speak.call(this);
};

Monster.create = function () {
return new Monster();
};

return Monster;
})(Entity);
```

We can now rewrite this with a much more consise, declarative syntax.

```javascript
class Monster extends Entity {
constructor(name) {
super();
this.name = name;
}

get scariness() {
return 'mild';
}

speak() {
super.speak();
}

static create() {
return new Monster();
}
}
```

