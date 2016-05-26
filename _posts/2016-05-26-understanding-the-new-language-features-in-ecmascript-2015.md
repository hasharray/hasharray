---
layout: post
title: Understanding the new language features in ECMAScript 2015
slug: understanding-the-new-language-features-in-ecmascript-2015
categories:
  - javascript
---

In this tutorial, we will be taking a look at the new features introduced in
the sixth edition of the JavaScript language.

This edition of JavaScript introduces a lot of new language syntax
features, it might even be the most feature packed revision to date in terms of
language additions, and that is with some of the features scheduled, like
comprehensions and rest and spread properties being delayed to the next
edition.

These features are also backwards compatible, in the sense that they are mostly
syntactic sugar and can be desugared to older versions of the language, meaning
we can use them even with runtimes that do not support them yet as long as we
compile through a source to source compiler (also known as a transpiler).

## Arrow Functions

Arrow functions are a function shorthand using the `=>` syntax. However, unlike
regular functions, arrow functions are bound to the lexical scope and share the
same lexical `this` context as the declaring code.

For example, previously with a normal function we would have to capture the
value of `this`

```javascript
this.message = 'hello world';
var that = this;

process.nextTick(function() {
  console.log(that.message);
});
```

Using an arrow function we can now drop that entirely.

```javascript
process.nextTick(() => {
  console.log(this.message);
});
```

Having a function body for an arrow function is optional, it may also be an
expression so we can make that previous example even more concise.

```javascript
process.nextTick(() => console.log(this.message));
```

## Binary and Octal Literals

Binary and Octal literals are new forms of numeric literals added for binary
and octal numbers, denoted by `b` and `o` respectively.

```javascript
0b111110111 === 503 // true
0o767 === 503 // true
```

## Block Scoping

Block scoping are new forms of declaration for defining variables scoped to
a single block, as opposed to variables declared with `var` which have
a function-level scope.

### Let

We can use let in-place of var to define block-local variables without having
to worry about them clashing with variables defined elsewhere within the same
function body.

```
for (var i = 0; i < 3; i++) {
   let j = i * i;
   console.log(j);
}

console.log(j); // => error, j is undefined
```

### Const

`const` follows the same rules as `let`, except that the value is immutable so we can only assign to it once.

```javascript
const PI = 3.14159265359;
PI = 0; // => Error: PI" is read-only
```

## Classes

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

## Destructuring Assignments

Destructuring assignment allows us to assign parts of an object to several
variables at once.

So lets say we have a `ball`,  the ball is defined as

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

### For Of

We can use the `for-of` loop to conveniently loop over iterable objects.

```javascript
for (let i of new RangeIterator([1, 10])) {
   console.log(i);
}
```

## Generators

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

## Method Definition Shorthand

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

## Modules

Modules provide declarative syntax for module patterns, this syntax feels a lot
like CommonJS modules, but it has some minor semantic differences.

Primarily it handles default exports a little differently. In CommonJS the
default export is the actual export object itself, where-as with ECMAScript
6 modules the default export is just another named export that is supported by
syntax.

```javascript
export function isEqual(a, b) {
  return a == b;
}

export default function assert(expression) {
  return expression == true;
}
```

Named exports are imported via `{ exportName }`

```javascript
import { isEqual } from './assert';
```

The default export can be imported just by specifying any identifier

```javascript
import { isEqual } from './assert';
```

Since the default export is a named export, one could import it that way too.

```javascript
import { default } from './assert';
```

Imports may also be aliased

```javascript
import { isEqual as checkEqual } from './assert';
```

Wilcard imports are also available

```javascript
import * as assert from './assert';
```

Which are mirrored by wildcard exports

```javascript
export * from './assert';
```

## Property Value Shorthand

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

## Rest Parameters

Rest parameters provides a cleaner way of dealing with variadic functions, that
is functions that take a arbitrary number of parameters.

```javascript
function add(...values) {
   let sum = 0;

   for (var val of values) {
      sum += val;
   }

   return sum;
}

add(2, 5, 3); // => 10
```

## Spread Operator

The spread operator allows an expression to be expanded in places where
multiple arguments or multiple elements are expected.

```javascript
var a = [0, 1, 2];
var b = [3, 4, 5];

a.push(...b);
console.log(a.join(' '));
```

## Template Strings

Template strings give us a new form of string literals using backticks, they
support both multiline strings and string interpolation via the `${}` syntax.

```javascript
console.log(`Hello World,
Today is ${new Date()}
`);
```

We can also use template strings in the form of tagged template strings,
allowing us to prefix the literal with a *tag*. Tags are basically filtering
functions that can perform substitutions and string manipulation.

```javascript
console.log(i18n`Hello World`);
```

## Conclusion

ECMAScript 6 introduces a lot of convenient new features, and more or less all of them can be backported with a compiler to ECMAScript 5.
