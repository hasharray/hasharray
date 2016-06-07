---
layout: page
title: Template Strings
---

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

